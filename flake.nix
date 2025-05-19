{
  description = "Personal NixOS configuration";

  inputs = {
    # NixOS official package source (unstable)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Command helper
    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Software center
    nix-software-center = {
      url = "github:snowfallorg/nix-software-center";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Settings center
    nixos-conf-editor = {
      url = "github:snowfallorg/nixos-conf-editor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ls (?)
    eza = {
      url = "github:eza-community/eza";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Desktop shell (customization)
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ?
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ?
    walker = {
      url = "github:abenz1267/walker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Waybar
    waybar = {
      url = "github:alexays/waybar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    # Lock screen
    hyprlock = {
      url = "github:hyprwm/Hyprlock";
    };

    # Idle
    hypridle = {
      url = "github:hyprwm/Hypridle";
    };

    # Plugins
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # NixOS configuration output
      # Used with `nixos-rebuild --flake .#<hostname>`
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [

          # Main
          ./hosts/default/configuration.nix

          # Base
          ./modules/nixos/bootloader.nix
          ./modules/nixos/networking.nix
          ./modules/nixos/audio.nix
          ./modules/nixos/nvidia.nix
          ./modules/nixos/firewall.nix
          ./modules/nixos/localization.nix
          ./modules/nixos/printing.nix
          ./modules/nixos/base-pkgs.nix
          ./modules/nixos/system.nix
          ./modules/nixos/steam.nix

          # Environment
          ./modules/environments/plasma.nix
          ./modules/environments/hyprland.nix

          # Inputs
          inputs.home-manager.nixosModules.default
          inputs.nixvim.nixosModules.nixvim
        ];
      };
    };
}
