{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.dev.rust;
in
{
  options.my.home.dev.rust.enable = lib.mkEnableOption "Rust dev tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      rustup
    ];
  };
}
