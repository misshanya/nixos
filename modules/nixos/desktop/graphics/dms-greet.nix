{
  config,
  lib,
  ...
}:

let
  cfg = config.my.desktop.graphics.dms-greet;
in
{
  options.my.desktop.graphics.dms-greet.enable = lib.mkEnableOption "DankGreet";

  config = lib.mkIf cfg.enable {
    services.displayManager.dms-greeter = {
      enable = true;
      compositor.name = lib.mkDefault "niri";
    };
    services.displayManager.gdm.enable = false;
  };
}
