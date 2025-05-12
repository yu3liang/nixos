{ config, pkgs, ... }:

{
  services.xserver = {
    # Enable X11 windowing system
    enable = true;
    
    # NVIDIA optimization to avoid stuttering
    deviceSection = ''
      Option "NoFlip" "true"
      Option "Coolbits" "28"
    '';

    # Keyboard layout
    xkb = {
      layout = "us";
      variant = "intl";
    };
  };

  # Activate KDE Plasma 6 and SDDM login manager
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Display synchronization and optimization
  environment.variables = {
    "KWIN_X11_REFRESH_RATE" = "60000";
    "KWIN_X11_NO_SYNC_TO_VBLANK" = "1";
    "KWIN_X11_FORCE_SOFTWARE_VSYNC" = "1";
  };
}
