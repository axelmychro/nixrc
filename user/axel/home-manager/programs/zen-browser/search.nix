_: {
  programs.zen-browser.profiles.default.search = {
    force = true;
    default = "ddg";
    engines = {
      pkgs = {
        name = "NixOS Packages";
        urls = [ { template = "https://search.nixos.org/packages?query={searchTerms}"; } ];
        definedAliases = [ "@np" ];
      };
      options = {
        name = "NixOS Options";
        urls = [ { template = "https://search.nixos.org/options?query={searchTerms}"; } ];
        definedAliases = [ "@no" ];
      };
      wiki = {
        name = "NixOS Options";
        urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
        definedAliases = [ "@nw" ];
      };
      mynixos = {
        name = "MyNixOS";
        urls = [ { template = "https://mynixos.com/search?q={searchTerms}"; } ];
        definedAliases = [ "@mn" ];
      };
    };
  };
}
