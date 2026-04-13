_: {
  programs.fish.shellAliases = {
    fmtnix = "fd -e nix -x sh -c 'nixfmt {}'";
    fmtkdl = "fd -e kdl -x sh -c 'kdlfmt format {}'";
  };
}
