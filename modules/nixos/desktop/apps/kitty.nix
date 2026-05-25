{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.desktop.apps.kitty;
in
{
  options.my.desktop.apps.kitty.enable = lib.mkEnableOption "Kitty terminal";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
