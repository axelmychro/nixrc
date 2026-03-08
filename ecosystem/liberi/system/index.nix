{ pkgs, noctalia, ... }:
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
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  imports = [ ./niri/index.nix ];
}
