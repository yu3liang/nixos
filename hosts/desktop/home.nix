{ pkgs, ... }:

let
  vars = import ../../variables.nix;
in

{
  imports = [
    # Enable Hyprland
    ../../configs/environments/hyprland/hyprland.nix

    # Symlink dotfiles to home directory
    ./home-link-dotfiles.nix
  ];

  # Set username and home directory path from variables.nix
  home.username = vars.user1;
  home.homeDirectory = vars.homeDirectoryUser1;
  
  # Build settings software
  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome-control-center}/bin/gnome-control-center";
    categories = [ "X-Preferences" ];
    terminal = false;
  };

  # Set environment files and variables
  home.file = { };
  home.sessionVariables = { };

  # Add "$HOME/.local/bin" to PATH
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  # Set Home-manager version
  home.stateVersion = "24.11"; # Don't change unless necessary
}
