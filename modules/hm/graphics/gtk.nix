{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.graphics.gtk;
in
{
  options.my.home.graphics.gtk.enable = lib.mkEnableOption "GTK";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      dconf
    ];

    gtk = {
      enable = true;
    };

    stylix.targets.gtk.enable = true;
  };
}
