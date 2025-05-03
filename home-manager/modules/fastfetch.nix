{ config, pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "small";
      };

      modules = [
        "title"

        {
          type = "os";
          format = "{name}";
        }

        "shell"

        {
          type = "wm";
          format = "{pretty-name}";
        }

        "terminal"
        "memory"
      ];
    };
  };
}
