{ pkgs, ... }:

{
  programs.wireshark.enable = true;
  users.users.mishanya.extraGroups = [ "wireshark" ];
  environment.systemPackages = with pkgs; [
    wireshark
  ];
}
