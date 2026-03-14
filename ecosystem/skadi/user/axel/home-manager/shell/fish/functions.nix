_: {
  programs.fish.functions = {
    generate = {
      body = ''
        argparse r/reboot u/update w/wipe -- $argv
        or return

        if set -q _flag_wipe
            nix profile wipe-history --verbpse
            nix store gc --verbose
            nix store optimise --verbose
        end
        if set -q _flag_update
          nix flake update --verbose
        end

        fd -e nix -x nixfmt {}
        fd -e kdl -x kdlfmt format {}
        git add .

        if sudo nixos-rebuild switch --verbose --flake .#skadi
          if set -q _flag_reboot
            echo "rebooting in 5 seconds. (Ctrl+C to cancel)"
            sleep 5
            systemctl reboot
          end
          return 0
        else
          echo "generate failed."
          return 1
        end
      '';
    };
  };
}
