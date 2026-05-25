{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.desktop.packages;
in
{
  options.my.desktop.packages.enable = lib.mkEnableOption "Desktop packages";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libsForQt5.qt5ct
      qt6Packages.qt6ct
      brightnessctl
    ];
  };
}
