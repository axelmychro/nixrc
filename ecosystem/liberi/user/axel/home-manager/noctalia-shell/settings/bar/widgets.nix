_: {
  programs.noctalia-shell.settings.bar.widgets = {
    left = [
      {
        id = "ControlCenter";
        useDistroLogo = false;
        enableColorization = true;
      }
      {
        id = "Network";
      }
      {
        id = "Bluetooth";
      }
    ];
    center = [
      {
        hideUnoccupied = false;
        id = "Workspace";
        labelMode = "none";
      }
    ];
    right = [
      {
        id = "Brightness";
      }
      {
        id = "Volume";
      }
      {
        alwaysShowPercentage = false;
        id = "Battery";
        warningThreshold = 50;
      }
      {
        formatHorizontal = "hh:mm a, dd MMM";
        formatVertical = "hh mm";
        id = "Clock";
        useMonospacedFont = true;
        usePrimaryColor = true;
      }
      {
        id = "NotificationHistory";
      }
      {
        id = "Tray";
      }
    ];
  };
}
