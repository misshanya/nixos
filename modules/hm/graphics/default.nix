{ ... }:

{
  imports = [
    ./wayland.nix

    ./cliphist.nix
    ./mako.nix

    ./gtk.nix
    ./qt.nix

    ./dms.nix
    ./waybar.nix

    ./launchers

    ./niri.nix
  ];
}
