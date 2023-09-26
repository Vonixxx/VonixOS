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
