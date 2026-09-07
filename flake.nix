{
  description = ''
    This is a flake for workstations consisting of configurations for a desktop or a server.
    "Like a phoe-nix, cry and rise up from the ash.";
  '';

  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://attic.xuyh0120.win/lantian"
      "https://cache.nixos-cuda.org"
      "https://ezkea.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    git-hooks.url = "github:cachix/git-hooks.nix";

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-26.05";
    };
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    silentSDDM.url = "github:uiriansan/SilentSDDM";

    nixvim.url = "github:nix-community/nixvim/nixos-26.05";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    nixcord.url = "github:4evy/nixcord";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix/release-26.05";
  };

  outputs =
    { self, ... }@inputs:
    let
      version = "26.05";
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      mkConfig = import ./lib/mkconfig.nix { inherit inputs; };

      # Options
      intel_gpu = ./modules/graphics/intel.nix;
      nvidia_gpu = ./modules/graphics/nvidia.nix;
      #flatpak = ./modules/flatpak;
      #libvirt = ./modules/virtualisation/libvirt.nix;
      #vmware = ./modules/virtualisation/vmware.nix;
      #docker = ./modules/virtualisation/docker.nix;
      #podman = ./modules/virtualisation/podman.nix;
      aagl = ./modules/aagl;
    in
    {
      apps.${system} =
        builtins.mapAttrs
          (name: script: {
            program = "${pkgs.writeShellScriptBin name script}/bin/${name}";
            type = "app";
          })
          {
            build = "nixos-rebuild --sudo boot --flake .#$HOSTNAME";
            check = "nixos-rebuild --sudo dry-run --flake .#$HOSTNAME";
            clean = ''
              nix-collect-garbage --delete-old
              nix store optimise
            '';
            run = "nixos-rebuild --sudo switch --flake .#$HOSTNAME";
            update = "nix flake update";
            default = "nix run .#run";
          };
      checks.${system}.pre-commit-check = inputs.git-hooks.lib.${system}.run {
        hooks = {
          deadnix = {
            enable = true;
            files = "\\.nix$";
          };
          nixfmt = {
            enable = true;
            files = "\\.nix$";
          };
          statix = {
            enable = true;
            files = "\\.nix$";
          };
        };
        src = ./.;
      };
      devShells.${system}.default =
        let
          inherit (self.checks.${system}.pre-commit-check) shellHook enabledPackages;
        in
        pkgs.mkShell {
          inherit shellHook;
          buildInputs = enabledPackages;
        };
      formatter =
        let
          config = self.checks.${system}.pre-commit-check.config;
          inherit (config) package configFile;
          script = "${pkgs.lib.getExe package} run --all-files --config ${configFile}";
        in
        pkgs.writeShellScriptBin "pre-commit-run" script;

      #
      # NixOS Configurations
      #
      nixosConfigurations = {
        prts = mkConfig "prts" {
          inherit version system;
          ecosystem = [
            "cosmic"
            "kde"
          ];
          theme = "rose-pine";
          extraModules = [
            (_: {
              nixpkgs.overlays = [
                inputs.nix-cachyos-kernel.overlays.pinned
                inputs.millennium.overlays.default
              ];
            })
            intel_gpu
            nvidia_gpu
            #flatpak
            #libvirt
            #vmware
            #docker
            #podman
            aagl
          ];
          users = [
            "axelmychro"
            "priestess"
          ];
        };
        prts-web = mkConfig "prts-web" {
          users = [ "axelmychro" ];
        };
        pts-skia = mkConfig "pts-skia" {
          ecosystem = "cosmic";
          users = [
            "axelmychro"
            "priestess"
          ];
        };
      };
    };
}
