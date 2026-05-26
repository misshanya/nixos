{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.dev.ts;
in
{
  options.my.home.dev.ts.enable = lib.mkEnableOption "TS dev tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs
      bun
    ];
  };
}
