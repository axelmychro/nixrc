_: {
  home.shell.enableBashIntegration = true;
  programs.bash = {
    enable = true;
    initExtra = builtins.readFile ./init.sh;
  };
}
