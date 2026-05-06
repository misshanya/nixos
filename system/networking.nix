{ ... }:

{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;

    interfaces.wlp2s0 = {
      allowedTCPPorts = [
        22
        3000
        3001
        5173
        9100
        22000
      ];
      allowedUDPPorts = [
        3000
        3001
        5173
        22000
      ];
    };

    trustedInterfaces = [ "tun0" ];
  };
}
