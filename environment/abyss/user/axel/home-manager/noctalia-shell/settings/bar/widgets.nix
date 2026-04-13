{ abyssAssets, ... }:
{
  home.file.".icon".source = "${abyssAssets}/icon.png";
  programs.noctalia-shell.settings.bar.widgets = {
    left = [
      {
        id = "NotificationHistory";
      }
      {
        id = "Clock";
        formatHorizontal = "hh:mm A";
        formatVertical = "hh mm A";
        useMonospacedFont = true;
        usePrimaryColor = true;
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
        id = "Workspace";
        hideUnoccupied = false;
        labelMode = "none";
      }
    ];
    right = [
      {
        id = "Volume";
      }
      {
        id = "Brightness";
      }
      {
        id = "Battery";
        displayMode = "graphic";
        showPercentageText = true;
        showPowerProfiles = true;
        showNoctaliaPerformance = true;
        warningThreshold = 50;
      }
      {
        id = "Tray";
        chevronColorKey = "mSecondary";
      }
    ];
  };
}
