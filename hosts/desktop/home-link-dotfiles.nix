{ config, ... }:

{
  # Hyprland configuration
  home.file."${config.xdg.configHome}/hypr/hyprland.conf" = { # TODO
    source = ../../configs/home/dotfiles/hypr/hyprland.conf;
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
}

