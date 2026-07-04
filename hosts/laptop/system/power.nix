{ ... }:

{
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

      CPU_SCALING_MIN_FREQ_ON_AC = 1400000;
      CPU_SCALING_MAX_FREQ_ON_AC = 4000000;

      CPU_SCALING_MIN_FREQ_ON_BAT = 1400000;
      CPU_SCALING_MAX_FREQ_ON_BAT = 2300000;

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      RUNTIME_PM_ON_BAT = "auto";
      PCIE_ASPM_ON_BAT = "powersaves";
      USB_AUTOSUSPEND = 1;
      SOUND_LPM_ON_BAT = "TRUE";
    };
  };

  services.auto-cpufreq.enable = false;
}
