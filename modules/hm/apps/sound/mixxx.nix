{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.apps.sound.mixxx;
in
{
  options.my.home.apps.sound.mixxx.enable = lib.mkEnableOption "Mixxx";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mixxx
    ];
  };
}
