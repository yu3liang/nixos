{ pkgs, ...}: 

{
  # Enable the Hyprland compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Set session variables
  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1"; # Fix invisible cursor
    NIXOS_OZONE_WL = "1"; # Hint electron apps (e.g. Discord) to use wayland
  };   

  # Hyprland environment packages
  home.packages = with pkgs; [ ];

  # Enable the XDG portal for Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
