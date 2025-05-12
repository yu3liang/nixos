{
  description = "Personal NixOS configuration";

  inputs = {
    # NixOS official package source
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable"; # Unstable channel
    };

    # Command helper
    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # NixOS configuration output
      # Used with `nixos-rebuild --flake .#<hostname>`
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
