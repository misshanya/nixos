{ ... }:
{
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
}
