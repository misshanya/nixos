{
  services.k3s = {
    enable = false;
    role = "agent";
    tokenFile = "/etc/nixos/secrets/k3s-token";
    serverAddr = "https://pc.home:6443";
  };
  networking.firewall.allowedUDPPorts = [
    8472
  ];
}
