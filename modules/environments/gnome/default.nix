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
       "org/gnome/shell/extensions/arcmenu" = {
         distro-icon                  = 8;
         custom-menu-button-icon-size = 35;
         hide-overview-on-startup     = true;
         menu-layout                  = "Budgie";
       };
       "org/gnome/shell/extensions/dash-to-panel" = {
         panel-positions  = "TOP";
       };
     };
   };
 };
}
