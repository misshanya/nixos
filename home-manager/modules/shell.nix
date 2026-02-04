{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
  ];

  programs.starship = {
    enable = true;
  };
  stylix.targets.starship.enable = true;

  programs.zoxide = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = [
    pkgs.lsd
  ];
}
