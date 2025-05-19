{ pkgs, config, libs, ... }:

let
  vars = import ../../variables.nix;
in

{
  # Sets the system hostname.
  networking.hostName = vars.desktop;

  # Enable DHCP for network interfaces
  useDHCP = libs.mkDefault true;

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



}

