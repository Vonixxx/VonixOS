#############
# VanillaOS #
#######################
# Gnome Configuration #
#######################
{ pkgs, config, ... }:

{
 services = {
   xserver = {
     layout = "cz";
     enable = true;

     desktopManager = {
       gnome.enable = true;
     };

     displayManager = {
       gdm = { 
         enable = true; 
         wayland = true;
       };
       defaultSession = "gnome";
     };
   };

   logind.lidSwitch = "poweroff";
 };

 hardware.pulseaudio.enable = false;
}
