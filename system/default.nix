{ ... }:

{
  imports = [
    ./boot.nix
    ./nix.nix
    ./disks.nix
    ./hardware.nix
    ./locale.nix
    ./users.nix
    ./fonts.nix
    ./virtualisation.nix
    ./networking.nix
  ];
}
