{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.apps.editors.zed;
in
{
  options.my.home.apps.editors.zed.enable = lib.mkEnableOption "Zed editor";

  config = lib.mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;

      extensions = [
        "nix"
        "go"
        "toml"
        "yaml"
        "rust"
        "wakatime"
      ];

      userSettings = {
        vim_mode = true;
      };
    };

    home.packages = with pkgs; [
      nil
      nixd
    ];
  };
}
