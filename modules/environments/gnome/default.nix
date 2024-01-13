###########
# VonixOS #
#######################
# Gnome Configuration #
#######################
{ lib, vars, config, ... }: with lib;

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

     enable                      = true;
     desktopManager.gnome.enable = true;
   };

   home-manager.users.${vars.user} = {
     dconf.settings = {
       "org/gnome/shell" = {
         enabled-extensions = [ "arcmenu@arcmenu.com" ];
       };
     };
   };
 };
}
