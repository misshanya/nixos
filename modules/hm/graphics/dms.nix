{
  config,
  lib,
  inputs,
  ...
}:

let
  cfg = config.my.home.graphics.dms;
in
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];
  options.my.home.graphics.dms.enable = lib.mkEnableOption "Dank Material Shell";

  config = lib.mkIf cfg.enable {
    # settings live in ~/.config/dms/settings.json, owned by DMS itself
    stylix.targets.dank-material-shell.enable = false;

    programs.dank-material-shell = {
      enable = true;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };

      niri.includes = {
        enable = true;
        override = false;

        filesToInclude = [
          "colors"
        ];
      };

      enableSystemMonitoring = true;
    };
  };
}
