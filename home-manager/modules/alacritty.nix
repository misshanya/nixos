{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      general.import = [ pkgs.alacritty-theme.rose_pine ];
      env.TERM = "xterm-256color";
      window = {
        opacity = 0.65;
        blur = true;
        padding.x = 5;
        padding.y = 0;
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Regular";
        };
        size = 12.0;
      };
    };
  };
}
