#############
# VanillaOS #
#######################
# Gnome Configuration #
#######################
{ pkgs, config, ... }:

{
 services = {
   xserver = {
     displayManager = {
       gdm.enable     = true; 
       defaultSession = "gnome";
     };

     layout                      = "cz";
     enable                      = true;
     desktopManager.gnome.enable = true;
   };
 };
}
