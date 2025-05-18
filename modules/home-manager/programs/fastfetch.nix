{ pkgs, ... }:

{
  home.packages = [ pkgs.fastfetch ];

  home.file.".config/fastfetch/config.jsonc".source = ../dotfiles/fastfetch/config.jsonc;

}
