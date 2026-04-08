{ lib, ... }:

{
  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enableSystemMonitoring = true;

    settings = {
      currentThemeName = lib.mkForce "dynamic";
      widgetBackgroundColor = lib.mkForce "s";
      widgetColorMode = lib.mkForce "colorful";
      cornerRadius = lib.mkForce 12;
      animationSpeed = lib.mkForce 2;
      showWorkspaceIndex = lib.mkForce true;

      showSeconds = lib.mkForce true;
      osdAlwaysShowValue = lib.mkForce true;

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
          deviceName = "backlight:amdgpu_bl1";
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

      networkPreference = lib.mkForce "wifi";
      launcherLogoMode = lib.mkForce "os";
      monoFontFamily = lib.mkForce "JetBrainsMonoNL Nerd Font Mono";
      soundVolumeChanged = lib.mkForce false;
      notificationPopupPosition = lib.mkForce 2;
      acMonitorTimeout = lib.mkForce 600;
      acLockTimeout = lib.mkForce 180;
      batteryMonitorTimeout = lib.mkForce 300;
      batteryLockTimeout = lib.mkForce 180;

      barConfigs = lib.mkForce [
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

      desktopWidgetInstances = lib.mkForce [
        {
          id = "dw_1772106915968_ivviqgog7";
          widgetType = "desktopClock";
          name = "Desktop Clock";
          enabled = true;
          config = {
            style = "analog";
            transparency = 1.0;
            colorMode = "primary";
            customColor = "#ffffff";
            showDate = false;
            showAnalogNumbers = true;
            showAnalogSeconds = true;
            displayPreferences = [ "all" ];
          };
          positions = {
            eDP-1 = {
              width = 200;
              height = 200;
              x = 0;
              y = 40.703125;
            };
            HDMI-A-1 = {
              width = 200;
              height = 200;
              x = 1820;
              y = 980;
            };
          };
        }
        {
          id = "dw_1772107486788_zxiq2k3j7";
          widgetType = "systemMonitor";
          name = "System Monitor";
          enabled = true;
          config = {
            showHeader = true;
            transparency = 0.8;
            colorMode = "primary";
            customColor = "#ffffff";
            showCpu = true;
            showCpuGraph = true;
            showCpuTemp = true;
            showGpuTemp = false;
            showMemory = true;
            showMemoryGraph = true;
            showNetwork = true;
            showNetworkGraph = true;
            showDisk = true;
            showTopProcesses = false;
            topProcessCount = 3;
            topProcessSortBy = "cpu";
            layoutMode = "auto";
            graphInterval = 60;
            displayPreferences = [ "all" ];
          };
          positions = {
            eDP-1 = {
              width = 160;
              height = 382.84375;
              x = 16.171875;
              y = 253.5078125;
            };
            HDMI-A-1 = {
              width = 320;
              height = 480;
              x = 1760;
              y = 840;
            };
          };
        }
      ];
    };
  };
}
