{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.apps.qbittorrent;
in
{
  options.my.home.apps.qbittorrent.enable = lib.mkEnableOption "Qbittorrent";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      qbittorrent
    ];
  };
}
