{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.dev.android;
in
{
  options.my.home.dev.android.enable = lib.mkEnableOption "Android dev tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      android-tools
    ];
  };
}
