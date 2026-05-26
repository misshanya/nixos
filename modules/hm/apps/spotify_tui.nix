{ config, lib, pkgs, ... }:

let
  cfg = config.my.home.apps.spotify-tui;
in
{
  options.my.home.apps.spotify-tui.enable = lib.mkEnableOption "Spotify TUI";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      spotify-player
    ];
  };
}
