{ config, lib, ... }:

let
  cfg = config.my.desktop.sound;
in
{
  options.my.desktop.sound.enable = lib.mkEnableOption "Sound services";

  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
