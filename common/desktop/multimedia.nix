{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.multimedia.enable {
    environment.systemPackages = with pkgs; [
      ffmpeg
      yt-dlp

      # capturer
      snapshot

      # audio
      amberol
      easyeffects
      eartag

      # image
      loupe
      imagemagick
      gradia

      # video
      haruna
      kdePackages.kdenlive
    ];
    programs.obs-studio = {
      package = pkgs.obs-studio.override { cudaSupport = true; };
      enableVirtualCamera = true;
      enable = true;
    };
  };
  options.common.multimedia.enable = lib.mkEnableOption "Common desktop multimedia packages.";
}
