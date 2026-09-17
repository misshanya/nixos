{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.dev.zig;
in
{
  options.my.home.dev.zig.enable = lib.mkEnableOption "Zig dev tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      zig
      zls
    ];
  };
}
