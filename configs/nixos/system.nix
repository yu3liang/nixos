{ ... }:

{
  # Allows installation of unfree (proprietary) packages from Nixpkgs.
  nixpkgs.config.allowUnfree = true;

  # Enables the OpenSSH server for remote access.
  openssh = {
    enable = true;
    settings = {
      # Disables password login for SSH to your machine (use keys instead).
      PasswordAuthentication = false;
    };
  };

  # Sets the NixOS system state version. This should match your NixOS release and only be changed when upgrading to a new release.
  system.stateVersion = "24.11"; # Don't change unless necessary
}
