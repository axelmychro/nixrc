{
  pkgs,
  noctalia,
  skadiAssets,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        noctalia
        skadiAssets
        ;
    };
    users.axel = {
      # home.pointerCursor = {
      # package = skadiPixelCursors;
      # name = "skadi-pixel-cursors";
      # };

      imports = [
        ./niri/index.nix
        ./noctalia-shell/index.nix
        ./programs/index.nix
      ];

      gtk = {
        enable = true;
        theme = {
          name = "Nordic";
          package = pkgs.nordic;
        };
        iconTheme = {
          name = "Nordzy";
          package = pkgs.nordzy-icon-theme;
        };
        # cursorTheme = {
        # name = "skadi-pixel-cursors";
        # package = skadiPixelCursors;
        # };
      };
      qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "Nordic";
      };
    };
  };
}
