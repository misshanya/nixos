{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.nettools;
in
{
  options.my.home.nettools.enable = lib.mkEnableOption "Nettools: tcpdump, etc.";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      tcpdump
    ];
  };
}
