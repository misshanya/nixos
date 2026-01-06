{ pkgs, ... }:

{
  virtualisation = {
    containers.enable = true;

    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    docker = {
      enable = true;
      storageDriver = "btrfs";
    };

    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
  };

  users.users.mishanya.extraGroups = [
    "libvirtd"
    "docker"
  ];
}
