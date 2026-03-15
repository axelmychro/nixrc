{
  spicePkgs,
  ...
}:
{
  programs.spicetify = {
    enable = true;
    experimentalFeatures = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
      fullAppDisplay
      popupLyrics
      fullAlbumDate
      copyToClipboard
      romajiConvert
      spicyLyrics
    ];
  };
}
