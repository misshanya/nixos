{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.my.home.apps.editors.opencode;
in
{
  options.my.home.apps.editors.opencode.enable = lib.mkEnableOption "Opencode";

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.nixpkgs-opencode.legacyPackages.${pkgs.system}.opencode
    ];
  };
}
