{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.desktop.graphics.gnome;
in
{
  options.my.desktop.graphics.gnome.enable = lib.mkEnableOption "GNOME DE";

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.displayManager.gdm.enable = lib.mkDefault true;
    services.desktopManager.gnome.enable = true;
    services.gnome.games.enable = false;
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs
    ];
    environment.systemPackages = with pkgs; [
      gnome-tweaks
    ];
    services.power-profiles-daemon.enable = false;
  };
}
