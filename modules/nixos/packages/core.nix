{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.packages.core;
in
{
  options.my.packages.core.enable = lib.mkEnableOption "Core packages";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lm_sensors
      smartmontools
      yazi
    ];
  };
}
