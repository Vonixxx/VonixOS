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
       incomplete-dir-enabled = false;
       download-dir           = "/home/vonix/Downloads";
     };
   };
 };
}
