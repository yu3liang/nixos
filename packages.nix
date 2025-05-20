{ pkgs, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Adds `swayosd` to udev runtime for event handling.
  services.udev.packages = [ pkgs.swayosd ];

    # Packages
  environment.systemPackages = with pkgs; [
    
    # GNOME
    gnome.gnome-bluetooth
    gnome.gnome-settings-daemon
    gnome.gnome-software
    glib
    nautilus-open-any-terminal
    libadwaita
    gnome-control-center
    gnome.gvfs
    gnome.sushi
    gnome.seahorse
    gnome.gnome-tweaks
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

    # Code
    yarn
    nodejs_22
    stylua
    codespell
    isort
    black
    prettierd
    shfmt
    jsbeautifier
    lua-language-server
    dart-sass
    bun
    neovide
    fzf
    libgcc
    libgccjit
    bintools-unwrapped
    nixpkgs-fmt
    python3
    gcc-unwrapped
    gnumake
    gccgo
    cargo
    ripgrep
    fd
    jq
    nil
    rustfmt
    java-language-server
    jsonfmt
    luaformatter
    typescript
    meson
    vala
    cmake
    pkg-config
    uncrustify
    #vala-language-server
    #neovim-unwrapped

    # Homelab
    rpi-imager
    super-slicer-beta
    orca-slicer

    # Information
    lutris
    openra
    firefox
    bitwarden
    vesktop
    #betaflight-configurator
    #BlHeliSuite32xl
    #betaflightConfigurator
    whatsapp-for-linux
    #kicad

    # Office
    obsidian
    libreoffice-fresh
    nextcloud-client
    mailspring
    localsend

    # Media
    obs-studio
    wf-recorder
    grimblast
    wayshot
    spotify
    gimp
    gthumb
    jellyfin-media-player
    heroic

    # System
    clipse
    proxmox-backup-client
    inputs.eza.packages.${system}.default
    inputs.hypridle.packages.${system}.default
    pika-backup
    envsubst
    grim
    deadnix
    mesa-demos
    mesa
    nitch
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
    wireguard-tools
    wireguard-go
    networkmanagerapplet
    intel-gpu-tools
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