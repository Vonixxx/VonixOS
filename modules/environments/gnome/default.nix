#############
# VanillaOS #
#######################
# Gnome Configuration #
#######################
{ pkgs, config, ... }:

{
 services = {
   logind.lidSwitch = "poweroff";

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
