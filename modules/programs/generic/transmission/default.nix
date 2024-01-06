###########
# VonixOS #
##############################
# Transmission Configuration #
##############################
{ pkgs, ... }:

{
 services = {
   transmission = { 
     enable = true;
   };
 };
}
