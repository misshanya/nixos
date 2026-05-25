{ ... }:

{
  imports = [
    ./docker.nix
    ./k3s.nix
    ./openssh.nix
    ./podman.nix
  ];
}
