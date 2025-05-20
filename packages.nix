{ pkgs, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "dotnet-runtime-6.0.36"
  ];

  # Adds `swayosd` to udev runtime for event handling.
  services.udev.packages = [ pkgs.swayosd ];

    # Packages
  environment.systemPackages = with pkgs; [
    
    # GNOME
    gnome-bluetooth
    gnome-settings-daemon
    gnome-software
    glib
    libadwaita
    gnome-control-center
    gnome.gvfs
    gnome-tweaks
    gtk4
    gtk3

    # Theming
    inputs.walker.packages.${system}.default
    inputs.anyrun.packages.${system}.default
    swaynotificationcenter
    swayosd
    wlogout
    fastfetch
    swww
    pywal
    imagemagick
    nwg-look
    hyprpicker
    gradience
    kitty-themes

    whatsapp-for-linux
    libreoffice-fresh

    # Media
    obs-studio
    wf-recorder
    spotify
    gimp
    gthumb

    # System
    clipse
    inputs.eza.packages.${system}.default
    inputs.hypridle.packages.${system}.default
    grim
    deadnix
    coreutils
    powerstat
    mate.mate-polkit
    polkit
    wget
    brightnessctl
    libnotify
    inotify-tools
    pavucontrol
    bluez
    bluez-tools
    wl-clip-persist
    wl-clipboard
    sway-audio-idle-inhibit
    xdg-desktop-portal
    distrobox
    nixos-icons
    libsecret
    networkmanagerapplet
    usbutils
    btop
    stress-ng
    slurp
    playerctl
    unzip
    wev
    sabnzbd
    wineWowPackages.waylandFull
    wlr-randr
    powertop
    poweralertd
    pulseaudio
    inputs.nh.packages.${system}.default
    satty

    # Personal
    # Productivity
    vscode
    emacs
    anki

    # Communication
    discord

    # Media
    spotify
    mpv

    # Utils
    obs-studio
    dualsensectl
    trigger-control
    wacomtablet
    firefox

    # Essential
    vim
    neovim
    git
    kitty
    fish
    librewolf
    fastfetch
    yazi
  ];
}