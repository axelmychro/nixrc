{
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.zed-mono
    nerd-fonts.fira-code
  ];
}
