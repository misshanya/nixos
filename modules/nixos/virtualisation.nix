{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.virtualisation;
in
{
  options.my.virtualisation = {
    enable = lib.mkEnableOption "Virtualisation with QEMU/KVM";
    user = lib.mkOption {
      type = lib.types.str;
      default = config.my.device.username;
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };
    };

    users.users.${cfg.user}.extraGroups = [
      "libvirtd"
    ];
  };
}
