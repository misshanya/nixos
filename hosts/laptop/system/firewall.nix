{ config, ... }:

let
  mainInterface = config.my.device.mainInterface;
in
{
  networking.firewall.interfaces.${mainInterface} = {
    allowedTCPPorts = [
      # dev
      3000
      3001
      5173

      # Node exporter
      9100
    ];
    allowedUDPPorts = [
      # dev
      3000
      3001
      5173
    ];
  };
}
