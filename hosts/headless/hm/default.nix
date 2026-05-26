{ pkgs, ... }:

{
  imports = [
    ../../../modules
    ../../../modules
  ];

  home.username = "mishanya";
  home.homeDirectory = "/home/mishanya";
  home.stateVersion = "24.11";

  my.home.shell = {
    enable = true;
    zsh.enable = true;
    git.enable = true;
  };

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
