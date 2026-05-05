{
  services.k3s = {
    enable = false;
    role = "agent";
    tokenFile = "/etc/nixos/secrets/k3s-token";
    serverAddr = "https://pc.home:6443";
  };
  networking.firewall.interfaces.wlp2s0.allowedUDPPorts = [
    8472
  ];
}
