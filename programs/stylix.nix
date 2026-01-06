{ ... }:

{
  imports = [
    ../modules/stylix.nix
  ];

  stylix.targets.plymouth.enable = true;
}
