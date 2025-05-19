{ pkgs, ... }:

{
  imports = [
  ];

  services = {
    fwupd.enable = true;
    tumbler.enable = true;
    gvfs.enable = true;
    gnome.core-utilities.enable = true;
    gnome.core-shell.enable = true;
    upower.enable = true;
    xserver.desktopManager.xfce.enable = true;
    power-profiles-daemon.enable = false;
    xserver.displayManager.gdm.enable = true;
    gnome.gnome-keyring.enable = true;
    gnome.tracker.enable = true;
    gnome.tracker-miners.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "intl";
      excludePackages = [ pkgs.xterm ];
    };
    acpid.enable = true;
    flatpak.enable = true;
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
      };
    };
  };
}
