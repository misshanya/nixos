{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.home.graphics.niri;

  proportion = proportion: { inherit proportion; };
in
{
  options.my.home.graphics.niri.enable = lib.mkEnableOption "Niri";

  config = lib.mkIf cfg.enable {
    programs.niri = {
      settings = {
        prefer-no-csd = true;
        screenshot-path = null;

        animations.slowdown = 0.7;

        input = {
          keyboard.xkb.layout = "us,ru";
          keyboard.xkb.options = "grp:caps_toggle";
        };

        layout = {
          gaps = 5;

          center-focused-column = "never";

          default-column-width = proportion 1.;
          preset-column-widths = [
            { proportion = 1. / 3; }
            { proportion = 1. / 2; }
            { proportion = 2. / 3; }
            { proportion = 1.; }
          ];

          border = {
            enable = true;
            width = 2;
          };

          shadow.enable = false;
          focus-ring.enable = false;
        };

        binds = {
          "Mod+Return".action.spawn = [ "alacritty" ];

          "Mod+Alt+L".action.spawn = [
            "dms"
            "ipc"
            "lock"
            "lock"
          ];

          "Mod+Space".action.spawn = [
            "vicinae"
            "toggle"
          ];

          "Mod+V".action.spawn = [
            "vicinae"
            "vicinae://extensions/vicinae/clipboard/history"
          ];

          "XF86AudioRaiseVolume".action.spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.1+"
          ];
          "XF86AudioLowerVolume".action.spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.1-"
          ];
          "XF86AudioMute".action.spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SINK@"
            "toggle"
          ];
          "XF86AudioMicMute".action.spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SOURCE@"
            "toggle"
          ];

          "XF86AudioPlay".action.spawn = [
            "playerctl"
            "play-pause"
          ];
          "XF86AudioPause".action.spawn = [
            "playerctl"
            "play-pause"
          ];
          "XF86AudioStop".action.spawn = [
            "playerctl"
            "stop"
          ];
          "XF86AudioPrev".action.spawn = [
            "playerctl"
            "previous"
          ];
          "XF86AudioNext".action.spawn = [
            "playerctl"
            "next"
          ];

          "XF86MonBrightnessUp".action.spawn = [
            "brightnessctl"
            "--class=backlight"
            "set"
            "+10%"
          ];
          "XF86MonBrightnessDown".action.spawn = [
            "brightnessctl"
            "--class=backlight"
            "set"
            "10%-"
          ];

          "Mod+O" = {
            action.toggle-overview = [ ];
            repeat = false;
          };
          "Mod+Q" = {
            action.close-window = [ ];
            repeat = false;
          };

          "Mod+Left".action.focus-column-left = [ ];
          "Mod+Down".action.focus-window-down = [ ];
          "Mod+Up".action.focus-window-up = [ ];
          "Mod+Right".action.focus-column-right = [ ];

          "Mod+H".action.focus-column-left = [ ];
          "Mod+J".action.focus-window-down = [ ];
          "Mod+K".action.focus-window-up = [ ];
          "Mod+L".action.focus-column-right = [ ];

          "Mod+Ctrl+Left".action.move-column-left = [ ];
          "Mod+Ctrl+Down".action.move-window-down = [ ];
          "Mod+Ctrl+Up".action.move-window-up = [ ];
          "Mod+Ctrl+Right".action.move-column-right = [ ];

          "Mod+Ctrl+H".action.move-column-left = [ ];
          "Mod+Ctrl+J".action.move-window-down = [ ];
          "Mod+Ctrl+K".action.move-window-up = [ ];
          "Mod+Ctrl+L".action.move-column-right = [ ];

          "Mod+Page_Down".action.focus-workspace-down = [ ];
          "Mod+Page_Up".action.focus-workspace-up = [ ];
          "Mod+U".action.focus-workspace-down = [ ];
          "Mod+I".action.focus-workspace-up = [ ];

          "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = [ ];
          "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = [ ];
          "Mod+Ctrl+U".action.move-column-to-workspace-down = [ ];
          "Mod+Ctrl+I".action.move-column-to-workspace-up = [ ];

          "Mod+Shift+Page_Down".action.move-workspace-down = [ ];
          "Mod+Shift+Page_Up".action.move-workspace-up = [ ];
          "Mod+Shift+U".action.move-workspace-down = [ ];
          "Mod+Shift+I".action.move-workspace-up = [ ];

          "Mod+WheelScrollDown" = {
            action.focus-workspace-down = [ ];
            cooldown-ms = 150;
          };
          "Mod+WheelScrollUp" = {
            action.focus-workspace-up = [ ];
            cooldown-ms = 150;
          };

          "Mod+Ctrl+WheelScrollDown" = {
            action.move-column-to-workspace-down = [ ];
            cooldown-ms = 150;
          };
          "Mod+Ctrl+WheelScrollUp" = {
            action.move-column-to-workspace-up = [ ];
            cooldown-ms = 150;
          };

          "Mod+WheelScrollRight" = {
            action.focus-column-right = [ ];
            cooldown-ms = 150;
          };
          "Mod+WheelScrollLeft" = {
            action.focus-column-left = [ ];
            cooldown-ms = 150;
          };

          "Mod+Ctrl+WheelScrollRight" = {
            action.move-column-right = [ ];
            cooldown-ms = 150;
          };
          "Mod+Ctrl+WheelScrollLeft" = {
            action.move-column-left = [ ];
            cooldown-ms = 150;
          };

          "Mod+Shift+WheelScrollDown" = {
            action.focus-column-right = [ ];
            cooldown-ms = 150;
          };
          "Mod+Shift+WheelScrollUp" = {
            action.focus-column-left = [ ];
            cooldown-ms = 150;
          };

          "Mod+Ctrl+Shift+WheelScrollDown" = {
            action.move-column-right = [ ];
            cooldown-ms = 150;
          };
          "Mod+Ctrl+Shift+WheelScrollUp" = {
            action.move-column-left = [ ];
            cooldown-ms = 150;
          };

          "Mod+1".action.focus-workspace = 1;
          "Mod+2".action.focus-workspace = 2;
          "Mod+3".action.focus-workspace = 3;
          "Mod+4".action.focus-workspace = 4;
          "Mod+5".action.focus-workspace = 5;
          "Mod+6".action.focus-workspace = 6;
          "Mod+7".action.focus-workspace = 7;
          "Mod+8".action.focus-workspace = 8;
          "Mod+9".action.focus-workspace = 9;

          "Mod+Ctrl+1".action.move-column-to-workspace = 1;
          "Mod+Ctrl+2".action.move-column-to-workspace = 2;
          "Mod+Ctrl+3".action.move-column-to-workspace = 3;
          "Mod+Ctrl+4".action.move-column-to-workspace = 4;
          "Mod+Ctrl+5".action.move-column-to-workspace = 5;
          "Mod+Ctrl+6".action.move-column-to-workspace = 6;
          "Mod+Ctrl+7".action.move-column-to-workspace = 7;
          "Mod+Ctrl+8".action.move-column-to-workspace = 8;
          "Mod+Ctrl+9".action.move-column-to-workspace = 9;

          "Mod+BracketLeft".action.consume-or-expel-window-left = [ ];
          "Mod+BracketRight".action.consume-or-expel-window-right = [ ];

          "Mod+Comma".action.consume-window-into-column = [ ];
          "Mod+Period".action.expel-window-from-column = [ ];

          "Mod+R".action.switch-preset-column-width = [ ];
          "Mod+Shift+R".action.switch-preset-column-width-back = [ ];

          "Mod+Ctrl+Shift+R".action.switch-preset-window-height = [ ];
          "Mod+Ctrl+R".action.reset-window-height = [ ];

          "Mod+F".action.maximize-column = [ ];
          "Mod+Shift+F".action.fullscreen-window = [ ];
          "Mod+Ctrl+F".action.expand-column-to-available-width = [ ];

          "Mod+C".action.center-column = [ ];
          "Mod+Ctrl+C".action.center-visible-columns = [ ];

          "Mod+Minus".action.set-column-width = "-10%";
          "Mod+Equal".action.set-column-width = "+10%";

          "Mod+Shift+Minus".action.set-window-height = "-10%";
          "Mod+Shift+Equal".action.set-window-height = "+10%";

          "Mod+T".action.toggle-window-floating = [ ];
          "Mod+Shift+T".action.switch-focus-between-floating-and-tiling = [ ];

          "Mod+W".action.toggle-column-tabbed-display = [ ];

          "Print".action.screenshot = [ ];
          "Alt+Print".action.screenshot-window = [ ];
          "Shift+Print".action.screenshot-screen = [ ];

          "Mod+Shift+E".action.quit = [ ];

          "Mod+Shift+P".action.power-off-monitors = [ ];
        };
      };
    };

    home.packages = with pkgs; [
      playerctl
    ];
  };
}
