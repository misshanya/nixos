{ ... }:

{
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
      randomEncryption.enable = true;
    }
  ];

  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 150;
    priority = 100;
  };
}
