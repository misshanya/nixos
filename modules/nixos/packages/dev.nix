{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.packages.dev;
in
{
  options.my.packages.dev.enable = lib.mkEnableOption "Dev packages";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      go
      python314
      jdk25
    ];
  };
}
