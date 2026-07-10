{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.desktop.lan-mouse;
  mainInterface = config.my.device.mainInterface;
in
{
  options.my.desktop.lan-mouse.enable = lib.mkEnableOption "LAN Mouse";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lan-mouse
    ];
    networking.firewall.interfaces."${mainInterface}".allowedUDPPorts = [ 4242 ];
  };
}
