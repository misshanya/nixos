{ config, lib, ... }:

let
  cfg = config.my.desktop.flatpak;
in
{
  options.my.desktop.flatpak.enable = lib.mkEnableOption "Flatpak";

  config = lib.mkIf cfg.enable {
    services.flatpak.enable = true;
  };
}
