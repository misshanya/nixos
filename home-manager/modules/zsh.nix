{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ff = "fastfetch";
      cd = "z";
      ls = "lsd";
      dc = "docker compose";
      up = "docker compose up -d";
      upb = "docker compose up -d --build";
    };

    history = {
      size = 100000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.packages = [
    pkgs.lsd
  ];
}
