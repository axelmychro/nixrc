{ pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.fish;
    users.axel = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
  imports = [
    ./modules/programs/index.nix
    ./modules/services/index.nix
    ./home-manager/home.nix
  ];
}
