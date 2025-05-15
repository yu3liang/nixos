{ pkgs, config, libs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    kitty
    fish
    librewolf
  ];


  # Enable fish shell
  programs.fish.enable = true;
}
