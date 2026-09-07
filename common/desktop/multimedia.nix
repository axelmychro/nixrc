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
      easyeffects
      eartag
      imagemagick
      snapshot
      kdePackages.kdenlive
      yt-dlp
    ];
    programs.obs-studio = {
      package = pkgs.obs-studio.override { cudaSupport = true; };
      enableVirtualCamera = true;
      enable = true;
    };
  };
  options.common.multimedia.enable = lib.mkEnableOption "Common desktop multimedia packages.";
}
