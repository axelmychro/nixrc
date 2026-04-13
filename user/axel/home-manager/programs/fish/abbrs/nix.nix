_: {
  programs.fish.shellAbbrs = {
    nrs = "sudo nixos-rebuild switch";
    nrsf = "sudo nixos-rebuild switch --flake .#";
    nrt = "sudo nixos-rebuild test";
    nrtf = "sudo nixos-rebuild test --flake .#";
    nrd = "sudo nixos-rebuild dry-run";
    nrdf = "sudo nixos-rebuild dry-run --flake .#";
    nu = "nix flake update";

    nso = "nix store optimise";
    nsg = "nix store gc";
    nph = "nix profile history";
    nphx = "nix profile wipe-history";
  };
}
