{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.dev;
in
{
  imports = [
    ./nix.nix
    ./go.nix
    ./rust.nix
    ./ts.nix
    ./android.nix
  ];

  options.my.home.dev.enable = lib.mkEnableOption "Generic dev tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      docker-slim
      wakatime-cli
      openssl
      insomnia
      postgresql
      onefetch
      wrk
    ];
  };
}
