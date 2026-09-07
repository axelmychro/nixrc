{
  lib,
  theme,
  wallpaper-file,
  ...
}:
let
  lookAndFeel =
    if theme == "rose-pine" then "org.kde.breezedark.desktop" else "org.kde.breeze.desktop";
in
{
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    workspace = {
      inherit lookAndFeel;
      cursor = {
        size = 48;
        theme = if theme == "rose-pine" then "BreezeX-RoséPine" else "BreezeX-RoséPineDawn";
      };
      colorScheme = if theme == "rose-pine" then "CosmicDark" else "CosmicLight";
      wallpaper = wallpaper-file;
    };
    kscreenlocker.appearance = {
      wallpaper = wallpaper-file;
      alwaysShowClock = true;
      showMediaControls = true;
    };
    kwin.effects = {
      hideCursor.hideOnTyping = true;
      wobblyWindows.enable = true;
    };
    fonts =
      let
        family = "GoMono Nerd Font";
        pointSize = 12;
      in
      lib.genAttrs
        [
          "general"
          "fixedWidth"
          "small"
          "toolbar"
          "menu"
          "windowTitle"
        ]
        (_: {
          inherit family pointSize;
        });

    input.mice = [
      {
        vendorId = "046d";
        productId = "c077";
        name = "Logitech USB Optical Mouse";
        enable = true;
        acceleration = 0;
        accelerationProfile = "none";
        leftHanded = false;
        middleButtonEmulation = false;
        naturalScroll = false;
        scrollSpeed = 1;
      }
    ];
  };
}
