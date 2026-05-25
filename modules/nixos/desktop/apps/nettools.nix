{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.desktop.apps.nettools;
in
{
  options.my.desktop.apps.nettools = {
    enable = lib.mkEnableOption "Nettools: wireshark";
    user = lib.mkOption {
      type = lib.types.str;
      default = config.my.device.username;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.wireshark.enable = true;
    users.users.${cfg.user}.extraGroups = [ "wireshark" ];
    environment.systemPackages = with pkgs; [
      wireshark
    ];
  };
}
