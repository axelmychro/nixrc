{
  ...
}:
{
  home-manager = {
    users.axel = {
      xdg.configFile."niri/config.kdl".source = ../config/config.kdl;

    };
  };
}
