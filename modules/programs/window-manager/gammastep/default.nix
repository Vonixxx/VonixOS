###########
# VonixOS #
###########################
# Gammastep Configuration #
###########################
{ lib, config, ... }: with lib;

{
 options.window-manager.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.window-manager.enable) {
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
