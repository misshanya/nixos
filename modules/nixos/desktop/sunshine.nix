{ config, lib, ... }:

let
  cfg = config.my.desktop.sunshine;
  mainInterface = config.my.device.mainInterface;
in
{
  options.my.desktop.sunshine = {
    enable = lib.mkEnableOption "Sunshine";
    user = lib.mkOption {
      type = lib.types.str;
      default = config.my.device.username;
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.uinput.enable = true;
    users.users.${cfg.user}.extraGroups = [ "uinput" ];

    services.sunshine = {
      enable = true;
      capSysAdmin = true;
    };

    networking.firewall.interfaces.${mainInterface} = {
      allowedTCPPorts = [
        47984
        47989
        47990
        48010
      ];

      allowedUDPPorts = [
        47998
        47999
        48000
        48002
      ];
    };
  };
}
