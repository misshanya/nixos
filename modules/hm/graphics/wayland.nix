{ config, lib, ... }:

let
  cfg = config.my.home.graphics.wayland;
in
{
  options.my.home.graphics.wayland.enable = lib.mkEnableOption "Wayland tweaks";

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      GDK_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland;xcb";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      XDG_SESSION_TYPE = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
  };
}
