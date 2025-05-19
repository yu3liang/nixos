{ config, pkgs, ...}: 

{
  # Enable the Hyprland compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # environment.sessionVariables = {
  #   WLR_NO_HARDWARE_CURSORS = "1"; # Fix invisible cursor
  #   NIXOS_OZONE_WL = "1"; # Hint electron apps (e.g. Discord) to use wayland
  # };   

  # Hyprland environment packages
  environment.systemPackages = with pkgs;[
    waybar
    # eww
    dunst
    libnotify
    swww
    rofi-wayland
    grim
    slurp
    wl-clipboard
  ];

  # Enable the XDG portal for Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
