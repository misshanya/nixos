{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../../modules/hm
  ];

  nixpkgs.config.allowUnfree = true;

  my.home = {
    fastfetch.enable = true;
    nettools.enable = true;

    apps = {
      editors.helix.enable = true;
      editors.zed.enable = true;
      editors.opencode.enable = true;

      terminals.theming.enable = true;
      terminals.alacritty.enable = true;

      spotify-tui.enable = true;
    };

    graphics = {
      launchers.vicinae.enable = true;
      cliphist.enable = true;

      dms.enable = true;
      gtk.enable = true;
      qt.enable = true;
    };

    shell = {
      enable = true;
      zsh.enable = true;
      git.enable = true;
    };

    dev = {
      enable = true;
      nix.enable = true;
      go.enable = true;
      rust.enable = true;
      ts.enable = true;
    };
  };

  home = {
    username = "mishanya";
    homeDirectory = "/home/mishanya";

    stateVersion = "24.11";

    packages = with pkgs; [
      pavucontrol
      easyeffects
      cava
      libnotify
      wl-clipboard
      gcc
      ffmpeg
      tmux

      nitch

      jetbrains-toolbox

      libreoffice-qt6-fresh

      k3s

      tigervnc

      dig

      unzip
      compsize

      typst

      zip

      jq
      mpv
      yt-dlp
      pulseaudio

      obs-studio

      cryptsetup

      transmission_4-gtk

      pciutils
      usbutils

      inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.spotatui.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };

  news.display = "silent";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
