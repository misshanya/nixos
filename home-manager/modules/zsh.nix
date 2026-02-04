{ config, ... }:

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
      pc = "podman compose";
      up = "docker compose up -d";
      upb = "docker compose up -d --build";
    };

    history = {
      size = 100000;
      path = "${config.xdg.dataHome}/shell/history";
    };
  };

  programs.starship.enableZshIntegration = true;
  programs.direnv.enableZshIntegration = true;
  programs.zoxide.enableZshIntegration = true;
}
