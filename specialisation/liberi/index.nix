{ lib, noctalia, ... }:
{
  specialisation.liberi = {
    inheritParentConfig = true;
    configuration = {
      programs.niri.enable = true;
      services.desktopManager.plasma6.enable = lib.mkForce false;
      services.displayManager.ly.enable = true;
      services.displayManager.sddm.enable = lib.mkForce false;
      programs.walker.enable = true;
      programs.gtklock.enable = true;

      home-manager.users.axel = {
        # import the home manager module
        xdg.configFile."niri/config.kdl".source = ./config.kdl;
        imports = [
          noctalia.homeModules.default
        ];

        # configure options
        programs.noctalia-shell = {
          enable = true;
          settings = {
            # configure noctalia here
            bar = {
              density = "compact";
              position = "right";
              showCapsule = false;
              widgets = {
                left = [
                  {
                    id = "ControlCenter";
                    useDistroLogo = true;
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
                    alwaysShowPercentage = false;
                    id = "Battery";
                    warningThreshold = 30;
                  }
                  {
                    formatHorizontal = "HH:mm";
                    formatVertical = "HH mm";
                    id = "Clock";
                    useMonospacedFont = true;
                    usePrimaryColor = true;
                  }
                ];
              };
            };
            colorSchemes.predefinedScheme = "Monochrome";
            general = {
              avatarImage = "/home/drfoobar/.face";
              radiusRatio = 0.2;
            };
            location = {
              monthBeforeDay = true;
              name = "Marseille, France";
            };
          };
          # this may also be a string or a path to a JSON file.
        };
      };
    };
  };
}
