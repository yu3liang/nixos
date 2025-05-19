{ pkgs, config, libs, ... }:

let
  vars = import ../../variables.nix;
in

{
  # Hostname & Networking
  networking.hostName = vars.desktop;
  useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;

  # Wireless support via wpa_supplicant
  # networking.wireless.enable = true;

  # Proxy
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

}

