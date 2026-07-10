{ ... }:

{
  imports = [
    ./apps
    ./graphics

    ./lan-mouse.nix

    ./bluetooth.nix
    ./flatpak.nix
    ./sound.nix
    ./sunshine.nix
    ./packages.nix
  ];
}
