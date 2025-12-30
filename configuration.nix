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
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "quiet"
    "splash"
    "zswap.enabled=1"
    "zswap.compressor=zstd"
    "zswap.zpool=z3fold"
  ];

  # Create swapfile, size = 8GB
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 8*1024;
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
    extraGroups = [ "wheel" "libvirtd" "docker" "uinput" ];
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };

  # Hyprland
  programs.hyprland.enable = true;

  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = false; # turn on to use sddm
    theme = "sddm-astronaut-theme";
    extraPackages = with pkgs.qt6; [
      qtwayland
      qtmultimedia
      qtsvg
    ];
  };

  services.displayManager.gdm.enable = true;
  
  # enable gnome and disable some gnome's apps
  services.desktopManager.gnome.enable = true;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
  services.power-profiles-daemon.enable = false;

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
    jdk25

    # Theming
    libsForQt5.qt5ct qt6Packages.qt6ct

    smartmontools
    bat
    lm_sensors

    podman-tui
    podman-compose

    memtester # test RAM errors

    sddm-astronaut

    gnome-tweaks

    (writeShellScriptBin "hypr-eco-mode" ''
      #!/usr/bin/env bash
      HYPR_ANIM=$(hyprctl getoption animations:enabled | grep 'int: 1')

      if [ -n "$HYPR_ANIM" ]; then
        hyprctl --batch "\
          keyword animations:enabled 0;\
          keyword decoration:blur:enabled 0;\
          keyword decoration:shadow:enabled 0;\
          keyword decoration:active_opacity 1;\
          keyword decoration:inactive_opacity 1;\
          keyword general:border_size 1;\
          keyword decoration:rounding 0"
        
        notify-send -u low -t 2000 "Hyprland" "Eco Mode: ON 🔋"
      else
        hyprctl --batch "\
          keyword animations:enabled 1;\
          keyword decoration:blur:enabled 1;\
          keyword decoration:shadow:enabled 1;\
          keyword decoration:active_opacity 0.93;\
          keyword decoration:inactive_opacity 0.85;\
          keyword general:border_size 2;\
          keyword decoration:rounding 10"
          
        notify-send -u low -t 2000 "Hyprland" "Eco Mode: OFF ✨"
      fi
    '')
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

  # Power management
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "schedutil";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
  powerManagement.powertop.enable = true;

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
      };
    };
  };

  programs.virt-manager.enable = true;

  hardware.uinput.enable = true;
  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # DNS
  services.resolved.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 22000 3000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  networking.firewall.trustedInterfaces = [ "tun0" ];
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

