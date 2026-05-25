{ ... }:

{
  system.stateVersion = "24.11";

  imports = [
    ./hardware-configuration.nix
    ./disks.nix
    ./swap.nix
    ./boot.nix
    ./nix.nix
    ./firewall.nix
    ./power.nix
    ../../modules/nixos
  ];

  my.device.mainInterface = "wlp2s0";
  my.network.enable = true;
  my.earlyoom.enable = true;
  my.printing.enable = true;
  my.snapper.enable = true;
  my.syncthing.enable = true;
  my.tailscale.enable = true;
  my.virtualisation.enable = true;
  my.yggdrasil.enable = true;

  my.packages = {
    core.enable = true;
    dev.enable = true;
  };

  my.desktop = {
    packages.enable = true;

    apps.kdeconnect.enable = true;
    apps.kitty.enable = true;
    apps.librewolf.enable = true;
    apps.nettools.enable = true;
    apps.telegram.enable = true;
    apps.virt-manager.enable = true;
    apps.vscodium.enable = true;

    graphics.hyprland.enable = true;
    graphics.gnome.enable = true;

    bluetooth.enable = true;
    flatpak.enable = true;
    sound.enable = true;
    sunshine.enable = true;
  };

  my.server = {
    openssh.enable = true;

    docker.enable = true;
    podman.enable = true;
  };

  networking.hostName = "nixos";
}
