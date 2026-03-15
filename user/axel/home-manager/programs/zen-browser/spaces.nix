_: {
  programs.zen-browser.profiles.default = {
    spacesForce = true;

    spaces."Space" = {
      id = "c6de089c-410d-4206-961d-ab11f988d40a0";
      position = 1000;
      theme = {
        type = "gradient";
        colors = [
          {
            red = 46;
            green = 52;
            blue = 64;
            algorithm = "analogous";
            type = "explicit-lightness";
          }
        ];
        opacity = 1.0;
      };
    };
  };
}
