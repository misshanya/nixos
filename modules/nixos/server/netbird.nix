{ config, lib, ... }:

let
  cfg = config.my.server.netbird;
in
{
  options.my.server.netbird.enable = lib.mkEnableOption "NetBird Client";

  config = lib.mkIf cfg.enable {
    services.netbird.enable = true;
  };
}
