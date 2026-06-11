{ config, lib, ... }:

let
  cfg = config.my.earlyoom;
in
{
  options.my.earlyoom.enable = lib.mkEnableOption "OOMKiller";

  config = lib.mkIf cfg.enable {
    services.earlyoom = {
      enable = true;
      freeMemThreshold = 5;
      freeSwapThreshold = 100;
      enableNotifications = true;
    };
    systemd.oomd.enable = false;
  };
}
