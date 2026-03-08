{
  noctalia,
  ...
}:
{
  home-manager = {
    users.axel = {
      xdg.configFile."niri/config.kdl".source = ../config/config.kdl;
      imports = [ ./noctalia-shell/index.nix ];
    };
    extraSpecialArgs = { inherit noctalia; };
  };
}
