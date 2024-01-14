###########
# VonixOS #
##########################
# WLSunset Configuration #
##########################
{ ... }:

{
 home-manager.users.vonix.services = {
   wlsunset = {
     enable = true;

     temperature = {
       day   = 6500;
       night = 2000;
     };

     latitude      = "50.1";
     longitude     = "14.4";
     systemdTarget = "graphical-session.target";
   };
 };
}
