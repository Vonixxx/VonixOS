###########
# VonixOS #
###########################
# Gammastep Configuration #
###########################
{ lib
, config
, ...
}: 

with lib;

{
 config = mkIf (config.gammastep.enable) {
   home-manager.users.vonix.services = {
     gammastep = {
       enable    = true;
       latitude  = "50.1";
       longitude = "14.4";
  
       temperature = {
         day   = 6500;
         night = 1000;
       };
     };
   };
 };
}
