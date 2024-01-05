#############
# VanillaOS #
#######################
# Gnome Configuration #
#######################
{ pkgs, config, ... }:

{
 services = {
   hardware.pulseaudio.enable = false;

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
