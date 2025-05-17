{ config, pkgs, ... }:

{
  home.username = "yu3liang";
  home.homeDirectory = "/home/yu3liang";
  home.stateVersion = "24.11"; # Don't change unless necessary

  nixpkgs.config.allowUnfree = true;

  # User packages
  home.packages = with pkgs; [
    # Productivity
    vscode
    emacs
    anki

    # Communication
    discord
    teams-for-linux

    # Media
    spotify
    mpv

    # Utils
    obs-studio
    dualsensectl
    trigger-control
    wacomtablet


  ];
  
  # User dotfiles
  home.file = {
    ".config/hypr/hyprland.conf".source = ../../modules/home-manager/hyprland/hyprland.conf;
    ".config/kitty/kitty.conf".source = ../../modules/home-manager/kitty/kitty.conf;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yu3liang/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.fish = {
    enable = true;
    
    interactiveShellInit = ''
      fastfetch
    '';
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
