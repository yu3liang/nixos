
{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/main-user.nix
    inputs.home-manager.nixosModules.default
  ];

  # Enable Flakes on NixOS
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Main user
  main-user = {
    enable = true;
    userName = "yu3liang";
    description = "yu3liang";
  };

  # Home-manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "yu3liang" = import ./home.nix;
    };
  };
}
