{ ... }:

{
  # Enables the systemd-boot bootloader, which is a simple UEFI boot manager.
  boot.loader.systemd-boot.enable = true;
  # Allows NixOS to write to EFI variables, which is required for managing UEFI boot entries (needed for systemd-boot and other UEFI bootloaders).
  boot.loader.efi.canTouchEfiVariables = true;
}
