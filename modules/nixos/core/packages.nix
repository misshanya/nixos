{ pkgs, ... }:

{
  # base packages
  environment.systemPackages = with pkgs; [
    tree
    neovim
    wget
    git
    htop
    btop
    killall
    lsd
    nh
    bat
    ripgrep
  ];
}
