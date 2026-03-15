_: {
  system.nixos.label = "skadi";

  _module.args = {
    skadiAssets = ./assets;
  };

  imports = [
    ./system/index.nix
    ./user/axel/index.nix
  ];
}
