_: {
  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;

    interactiveShellInit = builtins.readFile ./init.fish;
  };
  imports = [
    ./abbrs/index.nix
    ./aliases/index.nix
    ./functions/index.nix
  ];
}
