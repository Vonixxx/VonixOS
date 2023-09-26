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
