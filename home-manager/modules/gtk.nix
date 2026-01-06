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
  };

  stylix.targets.gtk.enable = true;
}
