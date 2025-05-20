{ pkgs, config, libs, ... }:

let
  vars = import ../../variables.nix;
in

{
  # ==========================
  # ---------Audio------------
  # ==========================

  # Disables the legacy PulseAudio server.
  services.pulseaudio.enable = false;

  # Enables the real-time kit daemon, which allows audio processes to get real-time CPU scheduling (reduces audio glitches).
  security.rtkit.enable = true;

  services.pipewire = {
    # Enables PipeWire
    enable = true;

    # Enables ALSA (Advanced Linux Sound Architecture) support.
    alsa.enable = true;

    # Adds 32-bit ALSA support (for compatibility with some apps/games).
    alsa.support32Bit = true;

    # Provides a PulseAudio-compatible server via PipeWire (so apps expecting PulseAudio still work).
    pulse.enable = true;
    
    # Enable JACK support for professional audio.
    # jack.enable = true;
  };



  # ==========================
  # --------Bootloader--------
  # ==========================

  # Enables the systemd-boot bootloader, which is a simple UEFI boot manager.
  boot.loader.systemd-boot.enable = true;
  
  # Allows NixOS to write to EFI variables, which is required for managing UEFI boot entries (needed for systemd-boot and other UEFI bootloaders).
  boot.loader.efi.canTouchEfiVariables = true;



  # ==========================
  # -------Localization-------
  # ==========================

  # Sets your system timezone.
  time.timeZone = "America/Sao_Paulo";

  # Sets the default system language/locale to US English.
  i18n.defaultLocale = "en_US.UTF-8";
  
  # Sets specific locale categories (address, measurement, money, etc.)
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Sets the console keyboard layout
  console.keyMap = "us-intl";



  # ==========================
  # --------Bluetooth---------
  # ==========================

  # Graphical Bluetooth manager (GUI)
  services.blueman.enable = true;

  hardware = {
    # Enables Bluetooth hardware support.
    bluetooth.enable = true;

    # Turns on Bluetooth automatically at boot.
    bluetooth.powerOnBoot = true;

    bluetooth = {
      settings = {
        General = {
          # Supports both BLE (Bluetooth Low Energy) and classic Bluetooth.
          ControllerMode = "dual";

          # Allows devices to connect more quickly.
          FastConnectable = "true";

          # Enables experimental Bluetooth features.
          Experimental = "true";
        };
        
        Policy = {
          # Automatically enables Bluetooth adapters when detected.
          AutoEnable = "true";
        };
      };
    };
  };



  # ==========================
  # --------Networking--------
  # ==========================

  # Sets the system hostname.
  networking.hostName = vars.desktop;

  # Enable DHCP for network interfaces
  # networking.useDHCP = lib.mkDefault true;

  # Enable network manager
  networking.networkmanager.enable = true;
  
  # Wireless support via wpa_supplicant
  # networking.wireless.enable = true;

  # Proxy
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable firewall
  networking.firewall.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;



  # ==========================
  # ---------Printing---------
  # ==========================

  # Turns on the printing service (CUPS) to add and use printers.
  services.printing.enable = true;


  # ==========================
  # ----------System----------
  # ==========================

  # Allows installation of unfree (proprietary) packages from Nixpkgs.
  nixpkgs.config.allowUnfree = true;

  # Enables the OpenSSH server for remote access.
  services.openssh = {
    enable = true;
    settings = {
      # Disables password login for SSH to your machine (use keys instead).
      PasswordAuthentication = false;
    };
  };

  # Sets the NixOS system state version. This should match your NixOS release and only be changed when upgrading to a new release.
  system.stateVersion = "24.11"; # Don't change unless necessary



  # ==========================
  # ---------Services---------
  # ==========================

  services = {
    # Installs core GNOME utilities (file manager, calculator, etc.).
    gnome.core-utilities.enable = true;

    # Installs the GNOME Shell desktop environment.
    gnome.core-shell.enable = true;

    # Enables GDM, the GNOME Display Manager (login screen).
    xserver.displayManager.gdm.enable = true;

     # Enables GNOME Keyring for secure password storage.
    gnome.gnome-keyring.enable = true;

    # Enables Tracker, a file indexer/search tool.
    gnome.tracker.enable = true;

    # Enables Tracker Miners, which scan files for Tracker.
    gnome.tracker-miners.enable = true;

    # Enables the XFCE desktop environment.
    xserver.desktopManager.xfce.enable = true;
   
    xserver = {
      # Enables the X11 window system.
      enable = true;

      # Sets the keyboard layout to US.
      xkb.layout = "us";
      # Sets the keyboard variant to "intl" (international).
      xkb.variant = "intl";

      # Excludes xterm (terminal emulator) from being installed.
      excludePackages = [ pkgs.xterm ];
    };

    # Enables firmware updates for hardware (e.g. BIOS, peripherals).
    fwupd.enable = true;

    # Enables thumbnail generation for files (used by file managers).
    tumbler.enable = true;
    
    # Provides virtual filesystem support (e.g., mounting remote filesystems).
    gvfs.enable = true;
    
    # Enables Flatpak, a system for installing sandboxed apps.
    flatpak.enable = true;

    # Disables the power profiles daemon (used for power management).
    # power-profiles-daemon.enable = false;
    # Power management daemon (battery status, suspend, etc.).
    # upower.enable = true;
    # Enables ACPI daemon for handling power events (lid close, etc.).
    # acpid.enable = true;
  };



  # ==========================
  # ----------Video-----------
  # ==========================

  # Enables general graphics hardware support.
  hardware.graphics.enable = true;
  # Sets the X server to use the NVIDIA driver.
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Enables kernel mode-setting for NVIDIA (required for some features).
    modesetting.enable = true;
    
    # Disables fine-grained power management.
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    
    # Uses the proprietary (not open source) NVIDIA driver.
    open = false;

    # Installs the NVIDIA settings tool.
    nvidiaSettings = true;
    
    # Uses the stable version of the NVIDIA driver package.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Display synchronization and optimization
  environment.variables = {
    "__GL_SYNC_DISPLAY_DEVICE" = "HDMI-0";
    "VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE" = "HDMI-0";
  };
}
