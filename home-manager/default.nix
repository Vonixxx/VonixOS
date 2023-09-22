###########
# VonixOS #
##############################
# Home Manager Configuration #
##############################
{ config, pkgs, ... }:

#############
# Variables #
#############
let
 home-manager  = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in


{
 ###########
 # Imports #
 ###########
 imports = [
   (import "${home-manager}/nixos")
 ];


 ########################
 # Home Manager Version #
 ########################
 home-manager.users.vonix = { pkgs, ... }: {
   home.stateVersion = "23.05";
 };
}
