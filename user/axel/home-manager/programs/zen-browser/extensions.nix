{
  pkgs,
  firefox-addons,
  ...
}:
{
  programs.zen-browser.profiles.default.extensions.packages =
    with firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
      ublock-origin
      proton-pass
    ];
}
