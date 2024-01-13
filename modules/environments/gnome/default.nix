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
   services.xserver = {
     displayManager = {
       gdm.enable     = true;
       defaultSession = "gnome";
     };

     desktopManager.gnome.enable = true;
   };
 };
}
