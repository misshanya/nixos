{ config, pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "none";
      };

      modules = [
        "title"
        "separator"

        {
          type = "os";
          format = "{name}";
        }

        {
          type = "kernel";
          key = "kernel";
        }

        "uptime"

        "shell"

        {
          type = "wm";
          format = "{pretty-name}";
        }

        "terminal"

        "memory"
        "swap"
        {
          type = "cpu";
          format = "{name} ({cores-physical}/{cores-logical}) @ {freq-max}";
        }
        {
          type = "disk";
          format = "{name}: {size-used} / {size-total} - {size-percentage}";
        }
      ];
    };
  };
}
