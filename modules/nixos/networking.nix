{ config, lib, ... }:

let
  cfg = config.my.network;
in
{
  options.my.network.enable = lib.mkEnableOption "Network with NetworkManager, Resolved and firewall";

  config = lib.mkIf cfg.enable {
    networking.networkmanager.enable = true;
    services.resolved.enable = true;
    networking.firewall = {
      enable = true;
      trustedInterfaces = [ "tun0" ];
    };
  };
}
