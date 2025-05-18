{ config, pkgs, ... }:

{
  home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hyprland/hyprland.conf;
}
