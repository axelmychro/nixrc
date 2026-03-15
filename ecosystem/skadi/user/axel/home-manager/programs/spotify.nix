{
  spicePkgs,
  ...
}:
{
  programs.spicetify = {
    theme = spicePkgs.themes.comfy;
    colorScheme = "Nord";
  };
}
