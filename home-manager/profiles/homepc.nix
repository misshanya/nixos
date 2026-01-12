{ pkgs, ... }:

{
  imports = [
    ../modules/zsh.nix
    ../modules/vicinae.nix
  ];

  home.username = "mishanya";
  home.homeDirectory = "/home/mishanya";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    bat
    vscodium
    qwen-code
  ];

  services.vicinae.settings.launcher_window.opacity = 1;

  news.display = "silent";
  programs.home-manager.enable = true;
}
