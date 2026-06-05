{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.desktop.graphics.niri;
in
{
  options.my.desktop.graphics.niri.enable = lib.mkEnableOption "Niri";

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
    programs.niri.package = pkgs.niri;

    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];

    xdg.portal = {
      config.niri.default = [
        "gtk"
        "gnome"
      ];

      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];

      configPackages = [
        config.programs.niri.package
      ];
    };
  };
}
