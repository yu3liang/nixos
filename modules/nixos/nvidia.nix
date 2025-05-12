{ pkgs, config, libs, ... }:

{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement = {
      enable = false;
      finegrained = false;
    };

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Display synchronization and optimization
    environment.variables = {
      "__GL_SYNC_DISPLAY_DEVICE" = "HDMI-0";
      "VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE" = "HDMI-0";
    };
  };
}
