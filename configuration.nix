# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./stylix.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth.enable = true;

  # Use latest kernel (non lts)
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernelParams = [
    "zswap.enabled=1"
    "zswap.compressor=zstd"
    "zswap.zpool=z3fold"
  ];

  # Create swapfile, size = 16GB
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16*1024;
    randomEncryption.enable = true;
  }];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure compression
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/var".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
  };

  # Hostname
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Time zone.
  time.timeZone = "Europe/Moscow";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mishanya = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "docker" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };

  # Hyprland
  programs.hyprland.enable = true;

  # Browser
  programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
  };

  # Tailscale
  services.tailscale.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    kitty # For default Hyprland configuration
    telegram-desktop
    hyprlock
    hyprshot
    hypridle
    hyprsunset
    brightnessctl # For brightness control
    swww
    yazi
    btop
    htop
    killall
    catppuccin-cursors.macchiatoLavender
    lsd

    # Dev
    go
    python314
    vscodium

    # Theming
    libsForQt5.qt5ct qt6ct
    libsForQt5.breeze-qt5 

    smartmontools
    bat
    lm_sensors

    podman-tui
    podman-compose

    memtester # test RAM errors
  ];

  # If want to use proxy to download nix packages
  # systemd.services.nix-daemon.environment = {
  #   http_proxy = "socks5h://user:password@host:port";
  #   HTTPS_PROXY = "socks5h://user:password@host:port";
  # };

  # Shell
  programs.zsh.enable = true;

  # KDE Connect
  programs.kdeconnect.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    inter
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.flatpak.enable = true;
  services.syncthing = {
    enable = true;
    group = "users";
    user = "mishanya";
    dataDir = "/home/mishanya/Documents";    # Default folder for new synced folders
    configDir = "/home/mishanya/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys
  };

  # TLP to save power on laptop
  services.tlp.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Podman
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # dockerCompat = true;

      defaultNetwork.settings.dns_enabled = true;
    };

    # Docker
    docker = {
        enable = true;
        storageDriver = "btrfs";
    };

    libvirtd = {
      enable = true;
      qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
          ovmf = {
            enable = true;
            packages = [(pkgs.OVMF.override {
                secureBoot = true;
                tpmSupport = true;
            }).fd];
          };
      };
    };
  };

  programs.virt-manager.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 22000 3000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

