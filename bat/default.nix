###########
# VonixOS #
#####################
# BAT Configuration #
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
 # BAT #
 #######
 home-manager.users.vonix = { pkgs, ... }: {
   programs.bat = {
     enable = true;
   };
 };
}
