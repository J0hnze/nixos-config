{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "apple-macbook-pro-14-1"; # Define your hostname.
}
