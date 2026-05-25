{ ... }:

{
  imports = [
    ./apps
    ./graphics

    ./bluetooth.nix
    ./flatpak.nix
    ./sound.nix
    ./sunshine.nix
    ./packages.nix
  ];
}
