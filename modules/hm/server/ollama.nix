{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.server.ollama;
in
{
  options.my.home.server.ollama.enable = lib.mkEnableOption "Ollama";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ollama
    ];
  };
}
