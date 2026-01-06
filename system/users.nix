{ pkgs, ... }:

{
  users.users.mishanya = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
