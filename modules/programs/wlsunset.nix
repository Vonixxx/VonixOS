###########
# VonixOS #
##########################
# WLSunset Configuration #
##########################
{ pkgs, vars ... }:

{
 home-manager.users.${vars.user} = {
   services.wlsunset = {
     ##########
     # Enable #
     ##########
     enable = true;
     ###############
     # Temperature #
     ###############
     temperature = {
       day   = 6500;
       night = 2000;
     };
     ############
     # Location #
     ############
     latitude  = "50.1";
     longitude = "14.4";
     #################
     # Miscellaneous #
     #################
     systemdTarget = "graphical-session.target";
   };
 };
}
