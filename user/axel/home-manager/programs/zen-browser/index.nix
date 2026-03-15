{
  pkgs,
  ...
}:
{
  imports = [
    ./bookmarks.nix
    ./extensions.nix
    ./pins.nix
    ./policies.nix
    ./search.nix
    ./spaces.nix
  ];
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
    profiles.default.isDefault = true;
  };
}
