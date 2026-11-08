{ pkgs, ... }:

let
  # Goodix 27c6:5110 is unsupported by upstream libfprint
  libfprint-goodix511 = pkgs.libfprint.overrideAttrs (old: {
    pname = "libfprint-goodixtls511";
    version = "1.94.9-goodixtls-unstable-2026-03-04";
    src = pkgs.fetchFromGitHub {
      owner = "buxel";
      repo = "libfprint";
      rev = "8c3674092ed29bfc6bf0fcf73b24fd821393508c"; # goodixtls-upstream-mr
      hash = "sha256-Rygz4tjdQnd0qhxm0NTiHip7gp5qPhFEPXN93oJY7kU=";
    };
    buildInputs = (old.buildInputs or [ ]) ++ [ pkgs.gnutls ];
    mesonFlags = (old.mesonFlags or [ ]) ++ [ "-Dgoodixtls=enabled" ];
    # the fork's test suite can't be configured in the nixpkgs build
    postPatch = (old.postPatch or "") + ''
      substituteInPlace meson.build --replace-fail "subdir('tests')" "installed_tests = false"
    '';
    doCheck = false;
    doInstallCheck = false;
  });
in
{
  services.fprintd = {
    enable = true;
    package = pkgs.fprintd.override { libfprint = libfprint-goodix511; };
  };

  security.pam.services.sudo.fprintAuth = true;
  # DMS lockscreen runs its own pam_fprintd session (enableFprint in its settings),
  # so this stack must stay password-only or both sessions fight over the reader
  security.pam.services.dankshell.fprintAuth = false;

  # the goodix driver spins on USB errors and ignores SIGTERM once the sensor
  # drops off the bus, so don't wait the default 90s before SIGKILL
  systemd.services.fprintd.serviceConfig.TimeoutStopSec = 5;

  # the sensor re-enumerates on suspend and fprintd keeps the stale USB handle;
  # stopping it before sleep lets D-Bus activate a fresh one on wake (restarting
  # after resume races with the dms lockscreen, which only tries once)
  systemd.services.fprintd-sleep = {
    description = "Stop fprintd before sleep";
    wantedBy = [ "sleep.target" ];
    before = [ "sleep.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/systemctl stop fprintd.service";
    };
  };
}
