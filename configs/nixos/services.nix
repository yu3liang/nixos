{ pkgs, ... }:

{
  services = {
    # Installs core GNOME utilities (file manager, calculator, etc.).
    gnome.core-utilities.enable = true;
    # Installs the GNOME Shell desktop environment.
    gnome.core-shell.enable = true;
    # Enables the XFCE desktop environment.
    xserver.desktopManager.xfce.enable = true;
    # Enables GDM, the GNOME Display Manager (login screen).
    xserver.displayManager.gdm.enable = true;
    # Enables GNOME Keyring for secure password storage.
    gnome.gnome-keyring.enable = true;
    # Enables Tracker, a file indexer/search tool.
    gnome.tracker.enable = true;
    # Enables Tracker Miners, which scan files for Tracker.
    gnome.tracker-miners.enable = true;
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
}
