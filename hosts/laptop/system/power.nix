{ ... }:

{
  services.tlp = {
    enable = true;
    settings = {
      # performace
      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_MIN_FREQ_ON_AC = 1400000;
      CPU_SCALING_MAX_FREQ_ON_AC = 4000000;
      CPU_BOOST_ON_AC = 1;
      PLATFORM_PROFILE_ON_AC = "performance";
      RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
      AMDGPU_ABM_LEVEL_ON_AC = 0;

      # battery
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
      CPU_SCALING_MIN_FREQ_ON_BAT = 1400000;
      CPU_SCALING_MAX_FREQ_ON_BAT = 3200000;
      CPU_BOOST_ON_BAT = 1;
      RUNTIME_PM_ON_BAT = "auto";
      PCIE_ASPM_ON_BAT = "powersave";
      PLATFORM_PROFILE_ON_BAT = "balanced";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "auto";
      AMDGPU_ABM_LEVEL_ON_BAT = 1;

      # powersave
      PLATFORM_PROFILE_ON_SAV = "low-power";
      RADEON_DPM_PERF_LEVEL_ON_SAV = "low";
      AMDGPU_ABM_LEVEL_ON_SAV = 2;

      USB_AUTOSUSPEND = 0;
    };
  };

  services.auto-cpufreq.enable = false;
}
