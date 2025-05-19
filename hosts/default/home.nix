{ config, pkgs, ... }:

{
  imports = [
    # Hyprland configuration
    ../../modules/home-manager/hyprland-config.nix

    # Programs configuration
    ../../modules/home-manager/programs/kitty.nix
    ../../modules/home-manager/programs/fastfetch.nix
  ];

  home.username = "yu3liang";
  home.homeDirectory = "/home/yu3liang";
  home.stateVersion = "24.11"; # Don't change unless necessary

  nixpkgs.config.allowUnfree = true;

  # User packages
  home.packages = with pkgs; [
    # Productivity
    vscode
    emacs
    anki

    # Communication
    discord
    teams-for-linux

    # Media
    spotify
    mpv

    # Utils
    obs-studio
    dualsensectl
    trigger-control
    wacomtablet

  ];
  
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Fish enabling and fastfetch execution
  programs.fish = {
    enable = true; # Already enabled at ~/nixos/modules/nixos/base-pkgs.nix

    interactiveShellInit = ''
      fastfetch
    '';
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
