{ config, ... }:

{
  # Hyprland
  home.file."${config.xdg.configHome}/hypr" = {
    source = ../../configs/home/dotfiles/hypr;
    recursive = true;
    enable = true;
  };

  # Kitty
  home.file."${config.xdg.configHome}/kitty" = {
    source = ../../configs/home/dotfiles/kitty;
    recursive = true;
    enable = true;
  };

  # Fastfetch
  home.file."${config.xdg.configHome}/fastfetch" = {
    source = ../../configs/home/dotfiles/fastfetch;
    recursive = true;
    enable = true;
  };

  # Waybar
  home.file."${config.xdg.configHome}/waybar" = {
    source = ../../configs/home/dotfiles/waybar;
    recursive = true;
    enable = true;
  };
}

