{
  plasma-manager,
  ...
}:
{
  home-manager = {
    users.axel = {
      imports = [
        ./programs/index.nix
        ./plasma-manager/plasma.nix
      ];
    };
    sharedModules = [
      plasma-manager.homeModules.plasma-manager
    ];
  };
}
