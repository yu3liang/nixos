{ config, pkgs, ... }:

{
  imports = [
    ../../configs/environments/hyprland/hyprland.nix
    # Programs configuration link
    ./home-link-dotfiles.nix
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

    # College
    ciscoPacketTracer8

    # Communication
    discord

    # Media
    spotify
    mpv

    # Utils
    obs-studio
    dualsensectl
    trigger-control
    wacomtablet
    firefox

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
