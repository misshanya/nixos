{ pkgs, ... }:

{
  imports = [
    ../modules/zsh.nix
    ../modules/git.nix
  ];

  home.username = "mishanya";
  home.homeDirectory = "/home/mishanya";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    gcc
    tree-sitter
    nodejs
    ripgrep
    fd
    unzip
    gzip
    gnutar
    neovim

    bat
  ];

  programs.home-manager.enable = true;
}
