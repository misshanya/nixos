{ pkgs, config, ... }:

let
  nodejs = pkgs.nodejs_25;
in
{
  imports = [
    ../modules/shell.nix
    ../modules/vicinae.nix
  ];

  home.username = "mishanya";
  home.homeDirectory = "/home/mishanya";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    bat
    vscodium
    nodejs
    rustup
    scrcpy
    grpcurl
  ];

  home.sessionVariables.PATH = "${config.home.homeDirectory}/.npm-global/bin:$PATH";

  services.vicinae.settings.launcher_window.opacity = 1;

  news.display = "silent";
  programs.home-manager.enable = true;
}
