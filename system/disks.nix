{ ... }:

{
  imports = [
    ./filesystems.nix
  ];

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
      randomEncryption.enable = true;
    }
  ];
}
