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
      joplin-desktop
      tmux
 

      # Dev
      golangci-lint
      nodejs_24
      
      # Code editors
      zed-editor

      # GRPC
      protobuf
      protoc-gen-go
      protoc-gen-go-grpc

      nitch # fetch
      onefetch # git repo fetch
      cargo
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
      kubectl

      # Remote desktop
      tigervnc

      dig

      # File manager
      kdePackages.qtsvg
      kdePackages.dolphin

      unzip
      compsize
    ];
  };

  news.display = "silent";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
