###########
# VonixOS #
################
# Mako Styling #
################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];

 
 ########
 # Mako #
 ########
 home-manager.users.vonix = { pkgs, ... }: {
   services.mako = {
     borderSize      = 1;
     icons           = true;
     markup          = true;
     layer           = "overlay";
     textColor       = "#FFFFFF";
     borderColor     = "#338FFF";
     backgroundColor = "#0C090A";
     anchor          = "bottom-right";
     font            = "Cascadia Code 10";
   };
 };
}
