{ config, lib, ... }:

let
  cfg = config.my.server.netbird;
in
{
  options.my.server.netbird.enable = lib.mkEnableOption "NetBird Client";

  config = lib.mkIf cfg.enable {
    services.netbird.enable = true;
    services.netbird.clients.wt0 = {
      port = 51821;
      openFirewall = true;
      openInternalFirewall = true;
    };
  };
}
