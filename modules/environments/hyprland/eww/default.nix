###########
# VonixOS #
#####################
# Eww Configuration #
#####################
{ pkgs, ... }:

{
 home-manager.users.vonix.programs = {
   eww = {
     enable    = true;
     configDir = ./configuration;
     package   = pkgs.eww-wayland;
   };
 };
}
