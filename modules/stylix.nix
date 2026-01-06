{ pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    polarity = "dark";
    fonts = {
      serif = {
        package = pkgs.liberation_ttf;
        name = "Liberation Serif";
      };

      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      sizes = {
        applications = 12;
        terminal = 12;
      };
    };
    autoEnable = true;
  };
}
