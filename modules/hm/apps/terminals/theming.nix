{ config, lib, ... }:

let
  cfg = config.my.home.apps.terminals.theming;
in
{
  options.my.home.apps.terminals.theming.enable =
    lib.mkEnableOption "Theming of terminals via stylix";

  config = lib.mkIf cfg.enable {
    stylix.opacity.terminal = 0.85;
  };
}
