_: {
  home.file.".face".source = ../../../../assets/face.jpg;
  programs.noctalia-shell.settings.general = {
    telemetryEnabled = false;
    language = "en";
    avatarImage = "/home/axel/.face";
    dimmerOpacity = 0.2;

    scaleRatio = 1;
    radiusRatio = 0.25;
    iRadiusRatio = 0.25;
    boxRadiusRatio = 1;

    showScreenCorners = false;
    forceBlackScreenCorners = false;
    screenRadiusRatio = 1;

    animationSpeed = 1;
    animationDisabled = false;

    compactLockScreen = true;
    lockScreenAnimations = true;
    lockOnSuspend = true;
    enableLockScreenCountdown = true;
    lockScreenCountdownDuration = 10000;
    clockStyle = "custom";
    clockFormat = "hh\nmm\na";

    showSessionButtonsOnLockScreen = false;
    showHibernateOnLockScreen = false;
    enableLockScreenMediaControls = true;

    enableBlurBehind = true;
    enableShadows = true;
    shadowDirection = "bottom_right";
    shadowOffsetX = 3;
    shadowOffsetY = 2;

    allowPanelsOnScreenWithoutBar = true;
    showChangelogOnStartup = true;

    autoStartAuth = false;
    allowPasswordWithFprintd = false;

    passwordChars = "triangle-filled";
    # "circle-filled", "pentagon-filled", "michelin-star-filled", "square-rounded-filled", "guitar-pick-filled", "blob-filled", "triangle-filled"

    lockScreenMonitors = [ ];

    lockScreenBlur = 0.1;
    lockScreenTint = 0.1;

    reverseScroll = false;
  };
  imports = [ ./keybinds.nix ];
}
