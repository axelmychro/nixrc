{ pkgs, noctalia, ... }:
{
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = { };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    nautilus
    nnn
  ];
  services.displayManager.ly.enable = true;
  imports = [ ./modules/index.nix ];
}
