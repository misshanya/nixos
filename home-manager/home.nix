{ config, pkgs, ... }:

{
  imports = [
    ./modules
  ];

  nixpkgs.config.allowUnfree = true;

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
      zoxide

      # Dev
      golangci-lint
      nodejs
      docker-slim
      go-mockery
      go-task
      wakatime-cli
      android-tools
      bun
      air
      nixfmt

      # Code editors
      zed-editor

      # GRPC
      protobuf
      protoc-gen-go
      protoc-gen-go-grpc
      buf

      nitch # fetch
      onefetch # git repo fetch
      rustup
      insomnia # api testing
      goose # for db migrations
      sqlc # for generating type safe go code
      openssl
      postgresql

      jetbrains-toolbox

      libreoffice-qt6-fresh # Libreoffice

      # For kubernetes tests :)
      minikube
      docker-machine-kvm2
      k3s

      # Remote desktop
      tigervnc

      dig

      # File manager
      kdePackages.qtsvg
      kdePackages.dolphin

      unzip
      compsize

      typst

      zip

      starship
      jq
      mpv
      wrk
      yt-dlp
      pulseaudio

      obs-studio

      cryptsetup

      transmission_4-gtk
    ];
  };

  news.display = "silent";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
