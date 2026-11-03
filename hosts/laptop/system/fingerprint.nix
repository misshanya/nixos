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
}
