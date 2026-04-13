_: {
  programs.fastfetch.enable = true;
  xdg.configFile = {
    "fastfetch" = {
      source = ./src;
      recursive = true;
    };
  };
}
