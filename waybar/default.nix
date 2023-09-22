###########
# VonixOS #
########################
# Waybar Configuration #
########################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ./bar.nix
   ./css.nix
   ../home-manager/default.nix
 ];
 

 ##########
 # Waybar #
 ##########
 home-manager.users.vonix = { pkgs, ... }: {
   programs.waybar = {
     enable = true;
   };
 };
}
