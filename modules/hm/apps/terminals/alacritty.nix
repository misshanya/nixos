{ config, lib, ... }:

let
  cfg = config.my.home.apps.terminals.alacritty;
in
{
  options.my.home.apps.terminals.alacritty.enable = lib.mkEnableOption "Alacritty";

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        env.TERM = "xterm-256color";
        window = {
          blur = true;
          padding.x = 5;
          padding.y = 0;
        };
        cursor = {
          style = {
            shape = "Underline";
          };
        };
      };
    };

    stylix.targets.alacritty = {
      enable = true;
    };
  };
}
