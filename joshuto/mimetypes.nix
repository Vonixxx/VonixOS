###########
# VonixOS #
###########################
# Mimetypes Configuration #
###########################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 #############
 # Mimetypes #
 #############
 home-manager.users.vonix = { pkgs, ... }: {
   programs.joshuto = {
     enable = true;
   };
 };
}
