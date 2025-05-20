{ config, pkgs, ... }:

let
  vars = import ../../variables.nix;
in

{
  imports = [
    ../../configs/environments/hyprland/hyprland.nix

    # Programs configuration symlink
    ./home-link-dotfiles.nix
  ];

  # Sets username and home directory path from variables.nix
  home.username = vars.user1;
  home.homeDirectory = vars.homeDirectoryUser1;
  
  # Sets settings software
  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome-control-center}/bin/gnome-control-center";
    categories = [ "X-Preferences" ];
    terminal = false;
  };

  # Sets environment files and variables
  home.file = { };
  home.sessionVariables = { };

  # Adds "$HOME/.local/bin" to PATH
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  # Let Home-manager install and manage itself
  programs.home-manager.enable = true;

  # Sets Home-manager version
  home.stateVersion = "24.11"; # Don't change unless necessary
}
