{ pkgs, ... }:

{
  imports = [
    ./dev.nix
  ];

  environment.systemPackages = with pkgs; [
    tree
    neovim
    wget
    git
    kitty

    telegram-desktop
    hyprlock
    hyprshot
    hypridle
    hyprsunset
    brightnessctl
    swww
    yazi
    htop
    btop
    killall
    lsd
    nh # nix helper

    catppuccin-cursors.macchiatoLavender
    libsForQt5.qt5ct
    qt6Packages.qt6ct

    smartmontools
    bat
    lm_sensors

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
      else
        hyprctl --batch "\
          keyword animations:enabled 1;\
          keyword decoration:blur:enabled 1;\
          keyword decoration:shadow:enabled 1;\
          keyword decoration:active_opacity 0.93;\
          keyword decoration:inactive_opacity 0.85;\
          keyword general:border_size 2;\
          keyword decoration:rounding 10"
      fi
    '')
  ];
}
