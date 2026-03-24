{
  pkgs,
  ...
}:
{
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
    profiles.default.isDefault = true;
  };
  imports = [
    ./bookmarks.nix
    ./pins.nix
    ./policies.nix
    ./search.nix
    ./settings.nix
    ./spaces.nix
  ];
}
