{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.desktop.apps.telegram;
in
{
  options.my.desktop.apps.telegram.enable = lib.mkEnableOption "Telegram";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      telegram-desktop
    ];
  };
}
