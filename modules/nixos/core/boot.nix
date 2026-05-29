{ lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;
  stylix.targets.plymouth.enable = true;

  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "quiet"
    "splash"
    "zswap.enabled=1"
    "zswap.compressor=zstd"
    "zswap.zpool=z3fold"
  ];
}
