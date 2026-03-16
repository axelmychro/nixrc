_: {
  services = {
    thermald = {
      enable = true;
      debug = true;
    };
    upower = {
      enable = true;
      percentageLow = 50;
      percentageCritical = 20;
      ignoreLid = true;
    };

    # major options below all conflict with each other
    power-profiles-daemon.enable = true;

    tlp = {
      enable = false;
      settings = {
        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 1;
      };
    };

    auto-cpufreq = {
      enable = false;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
          energy_performance_preference = "power";
          scaling_max_freq = 1600000;
        };
        charger = {
          governor = "powersave";
          turbo = "never";
          energy_performance_preference = "power";
          scaling_max_freq = 1600000;
        };
      };
    };
  };
}
