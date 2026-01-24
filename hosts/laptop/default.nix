{ ... }:

{
  system.stateVersion = "24.11";

  imports = [
    ./hardware-configuration.nix
    ./disks.nix
    ./swap.nix
    ./boot.nix
    ../../system
    ../../services
    ../../packages
    ../../programs
  ];

  networking.hostName = "nixos";
}
