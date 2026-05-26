{ config, lib, ... }:

let
  cfg = config.my.home.shell.git;
in
{
  options.my.home.shell.git.enable = lib.mkEnableOption "Git";

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings.user.name = "misshanya";
      settings.user.email = "mishanyadev@gmail.com";
      settings.core.editor = "nvim";

      signing.format = null;
    };
  };
}
