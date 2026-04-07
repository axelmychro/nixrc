{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    eza
    tree
    ripgrep
    fd
    bat
    imagemagick
    gdu
    btop
    gparted
    btrfs-progs
  ];
}
