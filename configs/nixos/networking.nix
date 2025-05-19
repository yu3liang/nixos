{ pkgs, config, libs, ... }:

let
  vars = import ../../variables.nix;
in

{
  # Hostname & Networking
  networking.hostName = vars.desktop;
  useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;
  
  # Enable firewall
  networking.firewall.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Wireless support via wpa_supplicant
  # networking.wireless.enable = true;

  # Proxy
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

}

