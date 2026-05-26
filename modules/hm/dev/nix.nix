{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.dev.nix;
in
{
  options.my.home.dev.nix.enable = lib.mkEnableOption "Nix dev tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nixfmt
    ];
  };
}
