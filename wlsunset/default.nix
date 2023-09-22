###########
# VonixOS #
##########################
# WLSunset Configuration #
##########################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 ############
 # WLSunset #
 ############
 home-manager.users.vonix = { pkgs, ... }: {
   services.wlsunset = {
     enable        = true;
     latitude      = "50.1";
     longitude     = "14.4";
     systemdTarget = "graphical-session.target";
     temperature = {
       day   = 6500;
       night = 2000;
     };
   };
 };
}
