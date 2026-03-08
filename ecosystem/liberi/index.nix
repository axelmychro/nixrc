{ pkgs, ... }:
{
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = { };
  environment.systemPackages = with pkgs; [
    fuzzel
    gtklock
    mako
    swayidle
    quickshell
  ];
  imports = [ ./system/index.nix ./user/axel/index.nix ];
}
