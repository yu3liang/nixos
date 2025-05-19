{ pkgs, config, libs, ... }:

{
  # Hostname & Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Wireless support via wpa_supplicant
  # networking.wireless.enable = true;

  # Proxy
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

}

