{ config, lib, ... }:

let
  cfg = config.my.desktop.apps.virt-manager;
in
{
  options.my.desktop.apps.virt-manager.enable = lib.mkEnableOption "VirtManager";

  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;
  };
}
