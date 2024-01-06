###########
# VonixOS #
#######################
# Gnome Configuration #
#######################
{ lib, config, ... }: with lib;

{
 options.gnome.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.gnome.enable) {
   services = {
     xserver = {
       displayManager = {
         gdm.enable     = true; 
         defaultSession = "gnome";
       };
  
       layout                      = "cz";
       enable                      = true;
       desktopManager.gnome.enable = true;
     };
   };
 };
}
