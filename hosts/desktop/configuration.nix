
{ lib, ... }:

let
  vars = import ../../variables.nix;
in

{
  imports = [
    # Hardware configuration module (needed)
    ./hardware-configuration.nix

    # Main-user module for user creation
    ../../configs/nixos/main-user.nix

    # Home-manager module
    inputs.home-manager.nixosModules.default
  ];

  # Enable Flakes on NixOS
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Main user configuration
  main-user = {
    enable = true;
    userName = "yu3liang";
    description = "yu3liang";
  };

  # Home-manager configuration
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "yu3liang" = import ./home.nix;
    };
  };
}
