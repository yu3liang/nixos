{ pkgs, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow insecure packages (don't know what these are for lol)
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
    "dotnet-runtime-6.0.36"
  ];

  # Packages
  environment.systemPackages = with pkgs; [

    # Version control
    git
    
    # Text editors
    emacs
    nano
    neovim
    vim
    vscode

    # File managers
    yazi

    # Terminal emulators
    kitty

    # Shells
    fish
    
    # Navigation
    firefox
    librewolf
    
    # Studies
    anki
    jflap

    # Communication
    discord
    teams-for-linux
    whatsapp-for-linux

    # Media
    spotify
    mpv
    obs-studio
    wf-recorder

    # Gaming
    steam

    # Funsies
    cmatrix

    # Office
    libreoffice-fresh

    # Image manipulation
    gimp
    gthumb
    imagemagick

    # CLI utils
    fastfetch
    btop
    wget
    playerctl
    deadnix

    # Device utils
    dualsensectl
    trigger-control
    wacomtablet

    # System utils
    brightnessctl
    coreutils
    dunst
    grim
    inotify-tools
    inputs.anyrun.packages.${system}.default
    inputs.hypridle.packages.${system}.default
    inputs.walker.packages.${system}.default
    libnotify
    libsecret
    mate.mate-polkit
    polkit
    rofi-wayland
    slurp
    swaynotificationcenter
    swayosd
    unzip
    usbutils
    wev
    wl-clip-persist
    wl-clipboard
    wineWowPackages.waylandFull
    wlogout
    wlr-randr
    xdg-desktop-portal

    # GNOME
    gnome-control-center
    gnome-settings-daemon
    gnome-software
    gnome-tweaks
    gnome-bluetooth
    gnome.gvfs
    libadwaita
    gtk4
    gtk3
    glib

    # Networking
    networkmanagerapplet

    # Audio
    pavucontrol
    pulseaudio
    sway-audio-idle-inhibit

    # Bluetooth
    bluez
    bluez-tools

    # Theming
    gradience
    hyprpicker
    inputs.anyrun.packages.${system}.default
    inputs.walker.packages.${system}.default
    kitty-themes
    nixos-icons
    nwg-look
    pywal

    # Desktop
    hyprpaper
    swww
    waybar
  ];

  # Add `swayosd` to udev runtime for event handling.
  services.udev.packages = [ pkgs.swayosd ];
}
