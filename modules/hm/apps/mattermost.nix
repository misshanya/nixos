{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.apps.mattermost;
in
{
  options.my.home.apps.mattermost.enable = lib.mkEnableOption "Mattermost";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mattermost-desktop
    ];
  };
}
