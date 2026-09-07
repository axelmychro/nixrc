{ inputs, ... }:
host:
{
  version,
  system,
  assets ? ../assets,

  ## Required
  users,

  ## Optional
  ecosystem ? [ ],
  extraArgs ? { },
  extraModules ? [ ],
  theme ? "rose-pine",
}:
let
  inherit (inputs.nixpkgs) lib;
  minimal_system = ecosystem == [ ] || builtins.elem "server" ecosystem;

  userConfigurations = lib.concatMap (
    u:
    let
      userConfigurationFile = ../user/${u};
      userHomeManagerConfigurationFile = userConfigurationFile + /home-manager;
    in
    [ userConfigurationFile ]
    ++ lib.optionals (!minimal_system && builtins.pathExists userHomeManagerConfigurationFile) [
      userHomeManagerConfigurationFile
    ]
  ) users;

  #
  # Theming
  #
  wallpaperFiles = {
    rose-pine-dawn = "wallpaper-rose_pine_dawn-kiana.png";
    rose-pine = "wallpaper-rose_pine-wisadel.png";
  };
  wallpaperFileName =
    wallpaperFiles.${theme} or (throw ''
      Unknown theme "${theme}".
      Available themes: ${
        lib.concatStringsSep "\n" (lib.mapAttrsToList (name: _: "  - ${name}") wallpaperFiles)
      }
    '');
  wallpaper-file = "${assets}/${wallpaperFileName}";

  #
  # Args
  #
  defaultArgs = {
    inherit
      version
      system
      assets
      theme
      wallpaper-file
      inputs
      ;
  };
in
lib.nixosSystem {
  modules = [
    { system.nixos.label = "${lib.concatStringsSep "-" ecosystem}-${version}"; }
    ../common/system
    ../host/${host}
    ./nixosconfiguser.nix
  ]
  ++ userConfigurations
  ++ lib.optionals (!minimal_system) [
    ../common/desktop
    inputs.home-manager.nixosModules.default
    ../modules/home-manager
    ../modules/audio
    ../modules/bluetooth
    ../modules/power
    ../modules/graphics
  ]
  ++ lib.concatMap (
    ecosystem:
    if ecosystem == "kde" then
      [
        ../ecosystem/kde
      ]
    else if ecosystem == "cosmic" then
      [
        ../ecosystem/cosmic
      ]
    else if ecosystem == "gnome" then
      [
        ../ecosystem/gnome
      ]
    else if ecosystem == "niri" then
      [
        inputs.noctalia.nixosModules.default
        ../ecosystem/niri
      ]
    else if ecosystem == "sway" then
      [
        ../ecosystem/sway
      ]
    else
      [ ]
  ) ecosystem
  ++ extraModules;
  specialArgs = defaultArgs // extraArgs;
}
