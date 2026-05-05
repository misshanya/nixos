{ ... }:

{
  imports = [
    ./sound.nix
    ./graphics.nix
    ./bluetooth.nix
    ./tailscale.nix
    ./flatpak.nix
    ./syncthing.nix
    ./power.nix
    ./ssh.nix
    ./dns.nix
    ./sunshine.nix
    ./snapper.nix
    ./earlyoom.nix
    ./k3s/agent.nix # for laptop only
    ./yggdrasil.nix
  ];
}
