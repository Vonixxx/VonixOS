###########
# VonixOS #
#######################
# Kitty Configuration #
#######################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 #########
 # Kitty #
 #########
 home-manager.users.vonix = { pkgs, ... }: {
   programs.kitty = {
     enable = true;
     theme = "Modus Vivendi";
     shellIntegration.enableZshIntegration = true;
     font = {
       name = "Cascadia Code";
     };
   };
 };
}
