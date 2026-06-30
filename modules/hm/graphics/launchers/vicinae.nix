{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

let
  cfg = config.my.home.graphics.launchers.vicinae;

  system = pkgs.stdenv.hostPlatform.system;
  vicinae-pkgs = inputs.vicinae-extensions.packages.${system};
in
{
  options.my.home.graphics.launchers.vicinae.enable = lib.mkEnableOption "Vicinae launcher";

  config = lib.mkIf cfg.enable {
    programs.vicinae = {
      enable = true;

      systemd = {
        enable = true;
        autoStart = true;
      };

      settings = {
        faviconService = "google";
        font.size = 11;

        popToRootOnClose = false;
        rootSearch.searchFiles = false;

        window = {
          csd = true;
          rounding = 5;
        };

        launcher_window.opacity = lib.mkForce 0.85;
      };

      extensions = with vicinae-pkgs; [
        nix
      ];
    };
  };
}
