{ config, lib, ... }:

let
  cfg = config.my.desktop.bluetooth;
in
{
  options.my.desktop.bluetooth.enable = lib.mkEnableOption "Bluetooth services";

  config = lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;
  };
}
