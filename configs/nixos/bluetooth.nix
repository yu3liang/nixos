{ ... }:

{
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
}