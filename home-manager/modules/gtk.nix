{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    dconf
  ];

  gtk = {
    enable = true;

    gtk4.theme = null;
  };

  stylix.targets.gtk.enable = true;
}
