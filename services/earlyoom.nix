{ ... }:

{
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 15;
    freeSwapThreshold = 100;
    enableNotifications = true;
  };

  systemd.oomd.enable = false;
}
