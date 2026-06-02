{ ... }:

{
  imports = [
    ./device.nix

    ./core
    ./desktop
    ./server
    ./packages

    ./earlyoom.nix
    ./networking.nix
    ./printing.nix
    ./snapper.nix
    ./syncthing.nix
    ./tailscale.nix
    ./virtualisation.nix
    ./yggdrasil.nix

    ./stylix.nix
  ];
}
