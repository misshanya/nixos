{ config, lib, ... }:

let
  cfg = config.my.desktop.apps.kdeconnect;
in
{
  options.my.desktop.apps.kdeconnect.enable = lib.mkEnableOption "KDE Connect";

  config = lib.mkIf cfg.enable {
    programs.kdeconnect.enable = true;
  };
}
