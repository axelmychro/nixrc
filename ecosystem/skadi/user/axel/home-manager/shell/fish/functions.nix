_: {
  programs.fish.functions = {
    generate = {
      body = ''
        fd -e nix -x nixfmt {}
        fd -e kdl -x kdlfmt format {}
        git add .
        sudo nixos-rebuild switch --flake .#skadi
      '';
    };
    generate-bleed = {
      body = ''
        nix flake update
        generate
      '';
    };
    generate-wipe = {
      body = ''
        nix profile wipe-history
        nix store gc
        nix store optimise
        generate
      '';
    };
  };
}
