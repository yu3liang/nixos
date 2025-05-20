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
      vars = import ./variables.nix;
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # NixOS system configuration output
      # Used with `nixos-rebuild --flake .#<hostname>`

      # Desktop
      nixosConfigurations = {
        tuxedo = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/desktop/configuration.nix
            ./configs/environments/plasma/plasma.nix
            inputs.nixvim.nixosModules.nixvim
          ];
        };
      };

    # Home configuration
    # Desktop
    homeConfigurations = {
      tuxedo = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
        inherit pkgs;
        modules = [
          ./hosts/desktop/home.nix
        ];
      };
    };
  };
}
