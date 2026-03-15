{
  pkgs,
  ...
}:
{
  programs.zen-browser.profiles.default.search = {
    force = true;
    default = "ddg";
    engines = {
      mynixos = {
        name = "MyNixOS";
        urls = [ { template = "https://mynixos.com/search?q={searchTerms}"; } ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@mno" ];
      };
    };
  };
}
