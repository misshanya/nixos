{
  config,
  lib,
  inputs,
  ...
}:

let
  cfg = config.my.home.graphics.dms;
in
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];
  options.my.home.graphics.dms.enable = lib.mkEnableOption "Dank Material Shell";

  config = lib.mkIf cfg.enable {
    programs.dank-material-shell = {
      enable = true;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };

      niri.includes = {
        enable = true;
        override = false;

        filesToInclude = [
          "colors"
        ];
      };

      enableSystemMonitoring = true;

      settings = lib.mkForce {
        currentThemeName = "dynamic";
        widgetBackgroundColor = "s";
        widgetColorMode = "colorful";
        cornerRadius = 12;
        animationSpeed = 2;
        showWorkspaceIndex = true;

        showSeconds = true;
        osdAlwaysShowValue = true;

        controlCenterWidgets = lib.mkForce [
          {
            id = "volumeSlider";
            enabled = true;
            width = 50;
          }
          {
            id = "brightnessSlider";
            enabled = true;
            width = 50;
          }
          {
            id = "wifi";
            enabled = true;
            width = 50;
          }
          {
            id = "bluetooth";
            enabled = true;
            width = 50;
          }
          {
            id = "audioOutput";
            enabled = true;
            width = 50;
          }
          {
            id = "audioInput";
            enabled = true;
            width = 50;
          }
          {
            id = "nightMode";
            enabled = true;
            width = 50;
          }
          {
            id = "darkMode";
            enabled = true;
            width = 50;
          }
        ];

        launcherLogoMode = "os";
        monoFontFamily = "Maple Mono Nerd Font";
        soundVolumeChanged = true;
        notificationPopupPosition = 2;
        acMonitorTimeout = 600;
        acLockTimeout = 180;
        batteryMonitorTimeout = 300;
        batteryLockTimeout = 180;

        barConfigs = [
          {
            id = "default";
            name = "Main Bar";
            enabled = true;
            position = 0;
            screenPreferences = [ "all" ];
            showOnLastDisplay = true;
            leftWidgets = [
              "launcherButton"
              "workspaceSwitcher"
              "focusedWindow"
              {
                id = "systemTray";
                enabled = true;
              }
              {
                id = "notificationButton";
                enabled = true;
              }
              {
                id = "clipboard";
                enabled = true;
              }
            ];
            centerWidgets = [
              "music"
              "clock"
              "weather"
            ];
            rightWidgets = [
              {
                id = "keyboard_layout_name";
                enabled = true;
              }
              {
                id = "cpuUsage";
                enabled = true;
              }
              {
                id = "cpuTemp";
                enabled = true;
              }
              {
                id = "memUsage";
                enabled = true;
              }
              {
                id = "battery";
                enabled = true;
              }
              {
                id = "controlCenterButton";
                enabled = true;
              }
            ];
            spacing = 0;
            innerPadding = 4;
            bottomGap = 0;
            transparency = 1.0;
            widgetTransparency = 1.0;
            squareCorners = true;
            noBackground = false;
            gothCornersEnabled = false;
            gothCornerRadiusOverride = false;
            gothCornerRadiusValue = 12;
            borderEnabled = false;
            borderColor = "surfaceText";
            borderOpacity = 1.0;
            borderThickness = 1;
            widgetOutlineEnabled = false;
            widgetOutlineColor = "surfaceText";
            widgetOutlineOpacity = 0.53;
            widgetOutlineThickness = 2;
            fontScale = 1.0;
            autoHide = false;
            autoHideDelay = 250;
            openOnOverview = false;
            visible = true;
            popupGapsAuto = true;
            popupGapsManual = 4;
            maximizeDetection = true;
          }
        ];
      };
    };
  };
}
