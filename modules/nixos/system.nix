{ pkgs, config, libs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon
  services.openssh.enable = true;

  # System version
  system.stateVersion = "24.11"; # Don't change unless necessary

}
