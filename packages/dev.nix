{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    go
    python314
    vscodium
    jdk25
    podman-tui
    podman-compose
  ];
}
