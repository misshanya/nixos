{ config, lib, ... }:

let
  cfg = config.my.server.docker;
in
{
  options.my.server.docker = {
    enable = lib.mkEnableOption "Docker";

    addUserToDockerGroup = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    user = lib.mkOption {
      type = lib.types.str;
      default = config.my.device.username;
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      storageDriver = "btrfs";
      daemon.settings = {
        dns = [
          "1.1.1.1"
          "8.8.8.8"
        ];
      };
    };

    users.users.${cfg.user}.extraGroups = lib.mkIf cfg.addUserToDockerGroup [
      "docker"
    ];
  };
}
