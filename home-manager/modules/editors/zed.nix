{ pkgs, ... }:
{
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
}
