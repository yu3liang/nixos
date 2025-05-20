{ pkgs, lib, inputs, ... }:

let
  vars = import ../../variables.nix;
in

{
  imports = [
    # Hardware configuration (needed)
    ./hardware-configuration.nix

    # NixOS basic configuration
    ../../configs/nixos.nix
    # ../../packages.nix

    # Enable Home Manager
    inputs.home-manager.nixosModules.home-manager

  ];

  # Enable the Hyprland compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # User configuration
  users.users.${vars.user1} = {
    isNormalUser = true;
    description = vars.user1;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vim
      neovim
      git
      kitty
      fish
      librewolf
      fastfetch
      yazi
    ];
  };

  # Enable Flakes on NixOS
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Home-manager configuration
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "yu3liang" = import ./home.nix;
    };
  };
}
