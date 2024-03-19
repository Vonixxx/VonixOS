###########
# VonixOS #
######################
# Aria Configuration #
######################
{ lib
, config
, ...
}:

with lib;

{
 config = mkIf (config.aria.enable) {
   services.aria2 = {
     enable      = true;
     downloadDir = "/home/vonixos/Downloads";
   };
 };
}
