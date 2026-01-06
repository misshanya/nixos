{ lib, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
