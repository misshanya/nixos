{ lib, ... }:

{
  options.my.device = {
    mainInterface = lib.mkOption {
      type = lib.types.str;
      description = "the primary network interface";
    };

    username = lib.mkOption {
      type = lib.types.str;
      default = "mishanya";
    };
  };
}
