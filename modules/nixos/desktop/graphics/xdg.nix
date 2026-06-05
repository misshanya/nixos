{ config, lib, ... }:

let
  cfg = config.my.desktop.graphics.xdg;
in
{
  options.my.desktop.graphics.xdg.enable = lib.mkEnableOption "XDG";

  config = lib.mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
  };
}
