{ inputs, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  vicinae-pkgs = inputs.vicinae-extensions.packages.${system};
in
{
  services.vicinae = {
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

      theme.dark = {
        name = "rose-pine";
      };
    };

    extensions = with vicinae-pkgs; [
      nix
    ];
  };
}
