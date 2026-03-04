_: {
  programs.plasma.panels = [
    {
      location = "top";
      alignment = "center";
      floating = false;
      height = 36;
      hiding = "none";
      lengthMode = "fill";

      widgets = [
        "org.kde.plasma.showdesktop"
        {
          pager.general = {
            showWindowOutlines = false;
            showApplicationIconsOnWindowOutlines = false;
            showOnlyCurrentScreen = false;
            navigationWrapsAround = false;
            displayedText = "desktopName";
          };
        }
        {
          iconTasks = {
            launchers = [ ];
          };
        }
        {
          systemMonitor = {
            title = "Memory";
            displayStyle = "org.kde.ksysguard.textonly";
            sensors = [
              {
                name = "memory/physical/usedPercent";
                label = "";
                color = "129,200,190";
              }
            ];
            textOnlySensors = [
              "memory/physical/used"
              "memory/physical/free"
              "memory/physical/total"
            ];
          };
        }
        {
          systemMonitor = {
            title = "CPU";
            displayStyle = "org.kde.ksysguard.textonly";
            sensors = [
              {
                name = "cpu/all/usage";
                label = "";
                color = "140,170,238";
              }
            ];
            textOnlySensors = [
              "cpu/cpu0/usage"
              "cpu/cpu1/usage"
              "cpu/cpu2/usage"
              "cpu/cpu3/usage"
              "cpu/cpu4/usage"
              "cpu/cpu5/usage"
              "cpu/cpu6/usage"
              "cpu/cpu7/usage"
              "cpu/cpu8/usage"
              "cpu/cpu9/usage"
              "cpu/cpu10/usage"
              "cpu/cpu11/usage"
            ];
          };
        }
        {
          systemMonitor = {
            title = "GPU";
            displayStyle = "org.kde.ksysguard.textonly";
            sensors = [
              {
                name = "gpu/gpu0/usage";
                label = "󰈈";
                color = "166,209,137";
              }
            ];
            textOnlySensors = [
              "gpu/gpu0/usedVram"
              "gpu/gpu0/totalVram"
            ];
          };
        }
        "org.kde.plasma.panelspacer"
        {
          digitalClock = {
            date.format.custom = "ddd, d MMM";
            calendar.firstDayOfWeek = "monday";
          };
        }
        "org.kde.plasma.panelspacer"
        {
          systemMonitor = {
            title = "Temperature";
            displayStyle = "org.kde.ksysguard.textonly";
            sensors = [
              {
                name = "cpu/all/maximumTemperature";
                label = "";
                color = "231,130,132";
              }
            ];
          };
        }
        {
          systemMonitor = {
            title = "Storage";
            displayStyle = "org.kde.ksysguard.textonly";
            sensors = [
              {
                name = "disk/all/usedPercent";
                label = "";
                color = "202,158,230";
              }
            ];
            textOnlySensors = [
              "disk/all/used"
              "disk/all/free"
              "disk/all/total"
            ];
          };
        }
        {
          systemTray.items = {
            shown = [
              "org.kde.plasma.networkmanagement"
              "org.kde.plasma.volume"
              "org.kde.plasma.battery"
              "org.kde.plasma.brightness"
            ];

            hidden = [
              "org.kde.plasma.clipboard"
              "org.kde.plasma.bluetooth"
              "org.kde.plasma.mediacontrol"
            ];
          };
        }

        {
          kickoff.icon = "nix-snowflake";
        }
      ];
    }
  ];
}
