{ config, lib, ... }:

let
  cfg = config.my.home.graphics.cliphist;
in
{
  options.my.home.graphics.cliphist.enable = lib.mkEnableOption "Cliphist";

  config = lib.mkIf cfg.enable {
    services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
