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
         disable-user-extensions = false;
         disabled-extensions = [ 
           ""
         ];
         enabled-extensions = [ 
           "space-bar@luchrioh"
           "arcmenu@arcmenu.com" 
           "dash-to-panel@jderose9.github.com"
           "burn-my-windows@schneegans.github.com"
           "user-theme@gnome-shell-extensions.gcapax.github.com"
         ];
       };
     };
   };
 };
}
