{ config, pkgs, ... }: {
  programs.caelestia = {
    enable = true;
    systemd.enable = true;
    
    settings = {
      paths.wallpaperDir = "~/wallpapers/new";

      general = {
        bar = {
          entries = [
            {
              id = "activeWindow";
              enabled = false;
            }
          ];
        };
      };
    };

    cli.enable = true;
  };
}
