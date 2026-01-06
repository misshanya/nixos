{ ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4ac62483-47bf-4fe6-9ee5-94c59077a4fd";
    fsType = "btrfs";
    options = [
      "subvol=@"
      "compress=zstd"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/4ac62483-47bf-4fe6-9ee5-94c59077a4fd";
    fsType = "btrfs";
    options = [
      "subvol=@home"
      "compress=zstd"
    ];
  };

  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/4ac62483-47bf-4fe6-9ee5-94c59077a4fd";
    fsType = "btrfs";
    options = [
      "subvol=@var"
      "compress=zstd"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/4ac62483-47bf-4fe6-9ee5-94c59077a4fd";
    fsType = "btrfs";
    options = [
      "subvol=@nix"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/CC6C-643A";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };
}
