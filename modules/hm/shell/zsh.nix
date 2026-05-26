{ config, lib, ... }:

let
  cfg = config.my.home.shell.zsh;
in
{
  options.my.home.shell.zsh.enable = lib.mkEnableOption "Zsh";

  config = lib.mkIf cfg.enable {
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
  };
}
