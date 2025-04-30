{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    dconf
  ];

  gtk = {
    enable = true;

    font = {
      name = "Inter";
      size = 12;
    };

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };

    # gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    # iconTheme = {
    #   name = "Colloid-Teal-Dracula-Dark";
    #   package = pkgs.colloid-icon-theme.override {
    #     schemeVariants = ["dracula"];
    #     colorVariants = ["teal"];
    #     };
    # };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
