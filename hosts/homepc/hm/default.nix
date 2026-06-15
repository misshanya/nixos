{ pkgs, config, lib, ... }:

{
  imports = [
    ../../../modules/hm
  ];
  
  stylix.enable = lib.mkForce false;

  home.username = "mishanya";
  home.homeDirectory = "/home/mishanya";
  home.stateVersion = "24.11";

  my.home.shell = {
    enable = true;
    git.enable = true;
    zsh.enable = true;
  };

  my.home.apps.editors.helix.enable = true;

  home.packages = with pkgs; [
    bat
    vscodium
    nodejs
    bun
    rustup
    scrcpy
    grpcurl
  ];

  home.sessionVariables.PATH = "${config.home.homeDirectory}/go/bin:${config.home.homeDirectory}/.npm-global/bin:$PATH";
  home.sessionVariables.KUBECONFIG = "${config.home.homeDirectory}/.kube/config";

  services.vicinae.settings.launcher_window.opacity = 1;
  services.vicinae.settings.theme.dark.name = "rose-pine";

  news.display = "silent";
  programs.home-manager.enable = true;
}
