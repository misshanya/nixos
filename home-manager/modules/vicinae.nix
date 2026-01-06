{ ... }:

{
  services.vicinae = {
    enable = true;

    systemd = {
      enable = true;
      autoStart = true;
    };

    settings = {
      faviconService = "google";
      font.size = 11;

      popToRootOnClose = false;
      rootSearch.searchFiles = false;

      window = {
        csd = true;
        rounding = 5;
      };

      theme.dark = {
        name = "rose-pine";
      };
    };
  };
}
