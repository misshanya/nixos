{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.desktop.apps.vscodium;
in
{
  options.my.desktop.apps.vscodium.enable = lib.mkEnableOption "VSCodium";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vscodium
    ];
  };
}
