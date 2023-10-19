###########
# VonixOS #
#####################
# Eww Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.eww = {
     enable    = true;
     configDir = ./bar;
     package   = pkgs.eww-wayland;
   };
 };
}
