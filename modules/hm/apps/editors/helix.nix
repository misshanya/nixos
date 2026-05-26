{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.apps.editors.helix;
in
{
  options.my.home.apps.editors.helix.enable = lib.mkEnableOption "Helix editor";

  config = lib.mkIf cfg.enable {
    programs.helix = {
      enable = true;
      settings = {
        theme = "rose_pine";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
        {
          name = "go";
          auto-format = true;
        }
        {
          name = "rust";
          auto-format = true;
        }
      ];
      languages.language-server.rust-analyzer = {
        config = {
          check.command = "clippy";
          diagnostics.styleLints.enable = true;
        };
      };
      extraPackages = with pkgs; [
        gopls
      ];
    };
    stylix.targets.helix.enable = false;
  };
}
