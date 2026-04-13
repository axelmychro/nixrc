_: {
  programs.fish.shellAliases = {
    x = "exec fish";
    xx = "exit";

    c = "cd";
    ".." = "cd ..";
    "..." = "cd ../..";
    ls = "eza --group-directories-first --no-permissions --octal-permissions --icons=auto --git";
    l = "ls -Ahl";
    mkdir = "mkdir -p";
    srm = "sudo rm -rf";
  };
  imports = [
    ./format.nix
  ];
}
