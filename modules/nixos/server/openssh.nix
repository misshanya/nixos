{ config, lib, ... }:

let
  cfg = config.my.server.openssh;
  mainInterface = config.my.device.mainInterface;
in
{
  options.my.server.openssh.enable = lib.mkEnableOption "OpenSSH";

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
    };

    networking.firewall.interfaces."${mainInterface}".allowedTCPPorts = [ 22 ];
  };
}
