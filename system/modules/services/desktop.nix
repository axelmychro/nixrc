{ lib, pkgs, ... }:
{
  services.xserver.excludePackages = [ pkgs.xterm ];
  fonts = {
    fontconfig = {
      enable = true;
      subpixel.rgba = "rgb";
      hinting = {
        enable = true;
        style = "full";
      };
    };
    packages = with pkgs; [
      nerd-fonts.geist-mono
    ];
  };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = lib.mkForce true;
  };

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
    backgrounds = {
      "rei.mp4" = ../../assets/rei.mp4;
    };

    settings = {
      "LoginScreen" = {
        background = "rei.mp4";
      };
      "LockScreen" = {
        background = "rei.mp4";
      };
      "LockScreen.Message" = {
        text = "Welcome back, Oracle.";
      };
    };
  };
}
