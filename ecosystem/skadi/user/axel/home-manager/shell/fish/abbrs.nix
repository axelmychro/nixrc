_: {
  programs.fish.shellAbbrs = {
    nrs = "sudo nixos-rebuild switch";
    nrsf = "sudo nixos-rebuild switch --flake .#skadi";
    nrt = "sudo nixos-rebuild test";
    nrtf = "sudo nixos-rebuild test --flake .#skadi";
    nrd = "sudo nixos-rebuild dry-run";
    nrdf = "sudo nixos-rebuild dry-run --flake .#skadi";
    nu = "nix flake update";

    nso = "nix store optimise";
    nsg = "nix store gc";
    nph = "nix profile history";
    nphx = "nix profile wipe-history";

    g = "git";
    ga = "git add";
    gc = "git commit -m";
    gp = "git push";

    nf = "fd -e nix -x sh -c 'nixfmt {}'";
    kf = "fd -e kdl -x sh -c 'kdlfmt format {}'";
  };
}
