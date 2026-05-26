{ config, lib, ... }:

let
  cfg = config.my.home.graphics.qt;
in
{
  options.my.home.graphics.qt.enable = lib.mkEnableOption "QT";

  config = lib.mkIf cfg.enable {
    qt = {
      enable = true;
    };
    stylix.targets.qt.enable = true;
  };
}
