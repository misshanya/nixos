{ config, lib, ... }:

let
  cfg = config.my.printing;
in
{
  options.my.printing.enable = lib.mkEnableOption "Printing service";

  config = lib.mkIf cfg.enable {
    services.printing.enable = true;
  };
}
