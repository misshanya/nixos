{ lib, ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    substituters = [
      "https://vicinae.cachix.org"
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
