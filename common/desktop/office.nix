{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.office.enable {
    environment.systemPackages = with pkgs; [
      libreoffice
      monero-gui
      telegram-desktop
      gnome-clocks
    ];
    programs.thunderbird.enable = true;
    programs.zoom-us.enable = true;
  };
  options.common.office.enable = lib.mkEnableOption "Common desktop office packages.";
}
