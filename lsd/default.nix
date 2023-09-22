###########
# VonixOS #
#####################
# LSD Configuration #
#####################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ./styling.nix
   ../home-manager/default.nix
 ];


 #######
 # LSD #
 #######
 home-manager.users.vonix = { pkgs, ... }: {
   programs.lsd = {
     enable = true;
   };
 };
}
