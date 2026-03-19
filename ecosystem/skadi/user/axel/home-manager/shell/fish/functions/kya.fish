if not test -f flake.nix
    set_color red
    echo "kya: must be run in directory with flake.nix"
    set_color normal
    return 1
end

argparse p/purge u/update r/reboot -- $argv
or return
set -l flake $argv[1]
set -l operation $argv[2]

if test -z "$flake"; or test -z "$operation"
    set_color red
    echo "kya: missing flake or operation"
    set_color yellow
    echo "usage: kya <flake> <operation> [flags]"
    set_color normal
    return 1
end

if not sudo -v
    return 1
end

if set -q _flag_purge
    set_color yellow
    echo "kya: purge history, clean garbage, optimise store"
    set_color normal
    sudo -v
    sudo nix-collect-garbage -d --verbose
    nix profile wipe-history --verbose
    nix store gc --verbose
    nix store optimise --verbose
end

set_color yellow
echo "kya: format nix, kdl, fish, sh"
set_color normal
sudo -v
fd -e nix -q; and fd -e nix -X nixfmt {}
fd -e kdl -q; and fd -e kdl -X kdlfmt format {}
fd -e fish -q; and fd -e fish -X fish_indent -w {}
fd -e sh -q; and fd -e sh -X shfmt -w -s -i 2 -ci -sr {}

git add .

if set -q _flag_update
    set_color yellow
    echo "kya: update flake"
    set_color normal
    sudo -v
    nix flake update --verbose
end

sudo -v
if sudo nixos-rebuild $operation --flake .#$flake --install-bootloader --verbose
    set_color green
    echo "kya: $flake $operation success"
    set_color normal

    if set -q _flag_reboot
        set_color yellow
        echo "rebooting in 5 seconds. (Ctrl+C to cancel)"
        set_color normal
        sleep 5
        systemctl reboot
    end
    return 0
else
    set_color red
    echo "kya: $flake $operation failed"
    set_color normal
    return 1
end
