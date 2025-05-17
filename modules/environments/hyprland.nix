{pkgs, ...}: 

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };


  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1"; # Fix invisible cursor
    NIXOS_OZONE_WL = "1"; # Hint electron apps (e.g. Discord) to use wayland
  };   


  environment.systemPackages = with pkgs;[
    waybar
    # eww
    dunst
    libnotify
    swww
    rofi-wayland
  ];


  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
