{ config, lib, ... }:

let
  cfg = config.my.server.k3s-agent;
  mainInterface = config.my.device.mainInterface;
in
{
  options.my.server.k3s-agent = {
    enable = lib.mkEnableOption "K3s Agent";

    tokenFile = lib.mkOption {
      type = lib.types.path;
      default = "/etc/nixos/secrets/k3s-token";
      description = "path to k3s token file";
    };

    serverAddr = lib.mkOption {
      type = lib.types.str;
      description = "master node addr";
    };
  };

  config = lib.mkIf cfg.enable {
    services.k3s = {
      enable = true;
      role = "agent";
      tokenFile = cfg.tokenFile;
      serverAddr = cfg.serverAddr;
    };
    networking.firewall.interfaces.${mainInterface}.allowedUDPPorts = [
      8472
    ];
  };
}
