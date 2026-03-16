{ pkgs, ... }:
{
  programs.fish.enable = true;
  users.users.axel.shell = pkgs.fish;
  imports = [
    ./home-manager/home.nix
  ];
}
