_: {
  programs.fish.shellAbbrs = {
    ff = "fastfetch";
  };
  imports = [
    ./git.nix
    ./nix.nix
  ];
}
