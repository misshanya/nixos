{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.shell;
in
{
  options.my.home.shell.enable = lib.mkEnableOption "basic shell tools";

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
    };
    stylix.targets.starship.enable = true;

    programs.zoxide = {
      enable = true;
    };

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    home.packages = [
      pkgs.lsd
    ];
  };
}
