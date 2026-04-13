_: {
  programs.fish.shellAbbrs = {
    nf = "fd -e nix -x sh -c 'nixfmt {}'";
    kf = "fd -e kdl -x sh -c 'kdlfmt format {}'";
  };
}
