{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.server.podman;
in
{
  options.my.server.podman.enable = lib.mkEnableOption "Podman";

  config = lib.mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    environment.systemPackages = with pkgs; [
      podman-tui
      podman-compose
    ];
  };
}
