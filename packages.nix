{ pkgs, inputs, ... }:

{
  # <----Packages---->
  environment.systemPackages = with pkgs; [

    # Version control
    git

    # Text editors
    nano
    vim
    neovim
    emacs
    vscode

    # File managers
    yazi

    # Terminal emulators
    kitty

    # Shells
    fish

    # Browsers
    librewolf
    firefox

    # Communication
    discord
    teams-for-linux
    whatsapp-for-linux

    # Studies
    anki
    
    # Media
    spotify
    mpv
    obs-studio
    deluge

    # Gaming
    steam

    # Office
    libreoffice-fresh
    pdf4qt

    # Image manipulation
    gimp

    # CLI utilities
    fastfetch
    btop
    wget
    deadnix

    # Device utilities
    dualsensectl
    trigger-control
    wacomtablet

    # System utilities
    coreutils
    psmisc
    dunst
    grim
    inotify-tools
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

    # GNOME utilities
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
    nwg-look
    nwg-bar

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
    hyprcursor
    nixos-icons
    nwg-look
    pywal
    inputs.anyrun.packages.${system}.default
    inputs.walker.packages.${system}.default

    # Desktop utilities
    hyprpaper
    waybar
    inputs.anyrun.packages.${system}.default
    inputs.hypridle.packages.${system}.default
    inputs.walker.packages.${system}.default

    # Fun utilities
    cmatrix
  ];

  # Add `swayosd` to udev runtime for event handling.
  services.udev.packages = [ pkgs.swayosd ];
}
