{
  ...
}:

{
  system.stateVersion = "24.11";

  imports = [
    ./hardware-configuration.nix
    ./stylix.nix

    ./system
    ./services
    ./packages
    ./programs
  ];
}
