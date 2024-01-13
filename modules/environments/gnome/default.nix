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
         custom-menu-button-icon-size = 35.0;
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

         favorite-apps = [
           "com.obsproject.Studio.desktop"
           "org.gnome.Console.desktop"
           "firefox.desktop"
           "freetube.desktop"
           "startcenter.desktop"
         ];

         enabled-extensions = [ 
           "arcmenu@arcmenu.com" 
           "dash-to-panel@jderose9.github.com"
           "burn-my-windows@schneegans.github.com"
           "user-theme@gnome-shell-extensions.gcapax.github.com"
         ];
       };

       "org/gnome/shell/extensions/dash-to-panel" = {
         panel-positions = "{\"0\":\"BOTTOM\"}";
         panel-element-positions = "{\"0\":[
             {\"element\":\"rightBox\",\"visible\":false,\"position\":\"stackedTL\"}
             {\"element\":\"centerBox\",\"visible\":false,\"position\":\"stackedTL\"}
             {\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedTL\"}
             {\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"}
             {\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"}

             {\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"}

             {\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"}

             {\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedTL\"}

             {\"element\":\"dateMenu\",\"visible\":true,\"position\":\"stackedTL\"}
         ]}";
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
