###########
# VonixOS #
#########################
# Styling Configuration #
#########################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 ###########
 # Styling #
 ###########
 home-manager.users.vonix = { pkgs, ... }: {
   programs.joshuto = {
     enable = true;
   };
 };
}
