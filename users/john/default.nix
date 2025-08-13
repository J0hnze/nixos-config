{ config, pkgs, ... }:

{
  imports = [ ./nix.nix ];
  home-manager.users.john = import ./home.nix;
}
