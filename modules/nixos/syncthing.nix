{ config, lib, ... }:

let
  cfg = config.my.syncthing;
  mainInterface = config.my.device.mainInterface;
in
{
  options.my.syncthing = {
    enable = lib.mkEnableOption "Syncthing";
    user = lib.mkOption {
      type = lib.types.str;
      default = config.my.device.username;
    };
  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      group = "users";
      user = cfg.user;
      dataDir = "/home/${cfg.user}/Documents";
      configDir = "/home/${cfg.user}/Documents/.config/syncthing";
    };

    networking.firewall.interfaces.${mainInterface} = {
      allowedTCPPorts = [ 22000 ];
      allowedUDPPorts = [ 22000 ];
    };
  };
}
