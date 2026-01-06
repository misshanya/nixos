{ lib, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault true;

  networking.firewall.allowedTCPPorts = [
    22
    22000
    3000
    5173
    9001
    9100
    10250
  ];
  networking.firewall.allowedUDPPorts = [
    22000
    21027
    5173
    8472
  ];
  networking.firewall.trustedInterfaces = [ "tun0" ];
}
