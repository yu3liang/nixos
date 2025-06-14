{ pkgs, inputs, ... }:

let
  vars = import ../../variables.nix;
in

{
  imports = [
    # Hardware configuration (needed)
    ./hardware-configuration.nix

    # NixOS basic configuration
    ../../configs/nixos.nix

    # Install packages
    ../../packages.nix

    # Enable Home-manager
    inputs.home-manager.nixosModules.home-manager

    # Enable NixVim
    inputs.nixvim.nixosModules.nixvim
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
    shell = pkgs.fish;
  };

  # Enable fish and fastfetch execution
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      fastfetch
    '';
  };

  # Enable Steam
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
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
