###########
# VonixOS #
#########################
# wPaperd Configuration #
#########################
{ lib, config, ... }: with lib;

{
 options.window-manager.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.window-manager.enable) {
   home-manager.users.vonix.programs = {
     wpaperd = {
       enable = true;
       settings = {
         default = { 
           duration     = "5m";
           apply-shadow = false;
           path         = "~/Pictures/Wallpapers"; 
         };
       };
     };
   };
 };
}
