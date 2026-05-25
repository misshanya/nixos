{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.desktop.apps.librewolf;
in
{
  options.my.desktop.apps.librewolf.enable = lib.mkEnableOption "Librewolf";

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
    };
  };
}
