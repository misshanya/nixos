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
    algorithm = "zstd";
    memoryPercent = 250;
    priority = 100;
  };
}
