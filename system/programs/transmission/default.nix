###########
# VonixOS #
##############################
# Transmission Configuration #
##############################
{ lib
, config
, ...
}:

with lib;

{
 config = mkIf (config.transmission.enable) {
   services.transmission = {
     enable = true;
     settings = {
       home = "/home/vonix/Transmission";
     };
   };
 };
}
