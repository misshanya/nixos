{ ... }:

{
  system.stateVersion = "24.11";

  imports = [
    ./hardware-configuration.nix
    ./swap.nix
    ../../system
    ../../services
    ../../packages
    ../../programs
  ];

  networking.hostName = "nixos";
}
