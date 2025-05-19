
{ lib, ... }:

let
  vars = import ../../variables.nix;
in

{
  imports = [
    # Hardware configuration (needed)
    ./hardware-configuration.nix

    # NixOS basic configuration
    ../../configs/nixos/audio.nix
    ../../configs/nixos/base-pkgs.nix
    ../../configs/nixos/bluetooth.nix
    ../../configs/nixos/bootloader.nix
    ../../configs/nixos/localization.nix
    ../../configs/nixos/main-user.nix
    ../../configs/nixos/networking.nix
    ../../configs/nixos/printing.nix
    ../../configs/nixos/services.nix
    ../../configs/nixos/system.nix
    # ../../nixos.nix
    # ../../packages.nix
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
