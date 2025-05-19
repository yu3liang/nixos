{ config, ... }:

{
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
