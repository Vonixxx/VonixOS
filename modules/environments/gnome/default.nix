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
       "org/gnome/system/location" = {
         enabled = true;
       };

       "org/gnome/desktop/datetime" = {
         automatic-timezone = true;
       };

       "org/gnome/desktop/privacy" = {
         recent-files-max-age   = 30;
         remove-old-trash-files = true;
         remove-old-temp-files  = true;
       };

       "org/gnome/desktop/interface" = {
         enable-hot-corners = false;
         color-scheme       = "prefer-dark";
       };

       "org/gnome/desktop/session" = {
         idle-delay = 0;
       };

       "org/gnome/shell/extensions/arcmenu" = {
         distro-icon                  = 8;
         custom-menu-button-icon-size = 35;
         hide-overview-on-startup     = true;
         menu-layout                  = "Budgie";
       };

       "org/gnome/settings-daemon/plugins/power" = {
         sleep-inactive-battery-type = "nothing";
         sleep-inactive-ac-type      = "nothing";
         power-button-action         = "interactive";
       };

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

       "org/gnome/shell/extensions/dash-to-panel" = {
         panel-positions = "'{\"0\":\"BOTTOM\"}'";
       };

       "org/gnome/settings-daemon/plugins/color" = {
         night-light-enabled            = true;
         night-light-schedule-automatic = true;
         night-light-temperature        = 1700;
       };
     };
   };
 };
}
