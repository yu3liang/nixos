{ pkgs, config, ... }:

let
  vars = import ../variables.nix;
in

{
  ############################################################### BOOTLOADER #####################################################################
  ################################################################################################################################################

  # Enable the systemd-boot bootloader, which is a simple UEFI boot manager.
  boot.loader.systemd-boot.enable = true;
  
  # Allow NixOS to write to EFI variables, which is required for managing UEFI boot entries (needed for systemd-boot and other UEFI bootloaders).
  boot.loader.efi.canTouchEfiVariables = true;

  ################################################################################################################################################
  ################################################################################################################################################

  # ----------------------------------------------------------------------------------------------------------------------------------------------

  ########################### NETWORKING ############################
  ###################################################################

  # Set the system hostname.
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

  ###################################################################
  ###################################################################

  # -----------------------------------------------------------------

  ########################### LOCALIZATION #############################
  ######################################################################

  # Set your system timezone.
  time.timeZone = "America/Sao_Paulo";

  # Set the default system language/locale to US English.
  i18n.defaultLocale = "en_US.UTF-8";
  
  # Set specific locale categories (address, measurement, money, etc.)
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

  # Set the console keyboard layout
  console.keyMap = "us-acentos";

  ######################################################################
  ######################################################################

  # --------------------------------------------------------------------

  ######################################################## AUDIO ##########################################################
  #########################################################################################################################

  # Disable the legacy PulseAudio server.
  services.pulseaudio.enable = false;

  # Enable the real-time kit daemon, which allows audio processes to get real-time CPU scheduling (reduces audio glitches).
  security.rtkit.enable = true;

  services.pipewire = {
    # Enable PipeWire
    enable = true;

    # Enable ALSA (Advanced Linux Sound Architecture) support.
    alsa.enable = true;

    # Add 32-bit ALSA support (for compatibility with some apps/games).
    alsa.support32Bit = true;

    # Provide a PulseAudio-compatible server via PipeWire (so apps expecting PulseAudio still work).
    pulse.enable = true;
    
    # Enable JACK support for professional audio.
    # jack.enable = true;
  };
  #########################################################################################################################
  #########################################################################################################################

  # -----------------------------------------------------------------------------------------------------------------------

  ################################# VIDEO ###################################
  ###########################################################################

  # Enable general graphics hardware support.
  hardware.graphics.enable = true;
  # Set the X server to use the NVIDIA driver.
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Enable kernel mode-setting for NVIDIA (required for some features).
    modesetting.enable = true;
    
    # Disable fine-grained power management.
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    
    # Use the proprietary (not open source) NVIDIA driver.
    open = false;

    # Install the NVIDIA settings tool.
    nvidiaSettings = true;
    
    # Use the stable version of the NVIDIA driver package.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Display synchronization and optimization
  environment.variables = {
    "__GL_SYNC_DISPLAY_DEVICE" = "HDMI-0";
    "VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE" = "HDMI-0";
  };
  ###########################################################################
  ###########################################################################

  # -------------------------------------------------------------------------

  ############################## BLUETOOTH #################################
  ##########################################################################

  # Graphical Bluetooth manager (GUI)
  services.blueman.enable = true;

  hardware = {
    # Enable Bluetooth hardware support.
    bluetooth.enable = true;

    # Turn on Bluetooth automatically at boot.
    bluetooth.powerOnBoot = true;

    bluetooth = {
      settings = {
        General = {
          # Support both BLE (Bluetooth Low Energy) and classic Bluetooth.
          ControllerMode = "dual";

          # Allow devices to connect more quickly.
          FastConnectable = "true";

          # Enable experimental Bluetooth features.
          Experimental = "true";
        };
        
        Policy = {
          # Automatically enable Bluetooth adapters when detected.
          AutoEnable = "true";
        };
      };
    };
  };

  ##########################################################################
  ##########################################################################

  # ------------------------------------------------------------------------

  ########################## PRINTING ############################
  ################################################################

  # Turn on the printing service (CUPS) to add and use printers.
  services.printing.enable = true;

  ################################################################
  ################################################################

  # --------------------------------------------------------------

  ################################ SERVICES ###################################
  #############################################################################

  services = {
    xserver = {
      # Enable the X11 window system.
      enable = true;

      # Set the keyboard layout to US.
      xkb.layout = "us";
      # Set the keyboard variant to "intl" (international).
      xkb.variant = "intl";

      # Exclude xterm (terminal emulator) from being installed.
      excludePackages = [ pkgs.xterm ];
    };

    # Enable firmware updates for hardware (e.g. BIOS, peripherals).
    fwupd.enable = true;

    # Enable thumbnail generation for files (used by file managers).
    tumbler.enable = true;
    
    # Provide virtual filesystem support (e.g., mounting remote filesystems).
    gvfs.enable = true;
    
    # Enable Flatpak, a system for installing sandboxed apps.w
    flatpak.enable = true;

    # Disable the power profiles daemon (used for power management).
    # power-profiles-daemon.enable = false;
    # Power management daemon (battery status, suspend, etc.).
    # upower.enable = true;
    # Enable ACPI daemon for handling power events (lid close, etc.).
    # acpid.enable = true;
  };
  #############################################################################
  #############################################################################

  # ---------------------------------------------------------------------------

  ########################################################## SYSTEM ###############################################################
  #################################################################################################################################

  # Allow installation of unfree (proprietary) packages from Nixpkgs.
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH server for remote access.
  services.openssh = {
    enable = true;
    settings = {
      # Disable password login for SSH to your machine (use keys instead).
      PasswordAuthentication = false;
    };
  };

  # Set the NixOS system state version. This should match your NixOS release and only be changed when upgrading to a new release.
  system.stateVersion = "24.11"; # Don't change unless necessary

  #################################################################################################################################
  #################################################################################################################################

  # -------------------------------------------------------------------------------------------------------------------------------
  
}
