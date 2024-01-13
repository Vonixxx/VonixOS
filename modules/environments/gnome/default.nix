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
       "org/gnome/desktop/session" = {
         idle-delay = 0;
       };

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

       "org/gnome/shell/extensions/arcmenu" = {
         distro-icon                  = 8;
         custom-menu-button-icon-size = 50.0;
         hide-overview-on-startup     = true;
         menu-layout                  = "Budgie";
       };

       "org/gnome/settings-daemon/plugins/color" = {
         night-light-enabled            = true;
         night-light-schedule-automatic = true;
         night-light-temperature        = 1700;
       };

       "org/gnome/settings-daemon/plugins/power" = {
         sleep-inactive-battery-type = "nothing";
         sleep-inactive-ac-type      = "nothing";
         power-button-action         = "interactive";
       };

       "org/gnome/desktop/interface" = {
         enable-hot-corners  = false;
         font-antialiasing   = "rgba";
         font-hinting        = "full";
         color-scheme        = "prefer-dark";
         font-name           = "Liberation Serif 12";
         document-font-name  = "Liberation Serif 12";
         monospace-font-name = "Liberation Mono 12";
         titlebar-font       = "Liberation Serif Bold 12";
       };

       "org/gnome/desktop/wm/preferences" = {
         button-layout = "appmenu:minimize,maximize,close";
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
           "user-theme@gnome-shell-extensions.gcampax.github.com"
         ];
       };

       "org/gnome/shell/extensions/dash-to-panel" = {
         appicon-margin        = 4;
         appicon-padding       = 8;
         animate-appicon-hover = true;
         dot-position          = "TOP";
         dot-style-focused     = "METRO";
         dot-style-unfocused   = "DASHES";
         panel-sizes           = "{\"0\":56}";
         panel-lengths         = "{\"0\":100}";
         panel-positions       = "{\"0\":\"BOTTOM\"}";

         panel-element-positions = "{\"0\":[
             {\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},
             {\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},
             {\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"},
             {\"element\":\"dateMenu\",\"visible\":true,\"position\":\"stackedBR\"}

             {\"element\":\"rightBox\",\"visible\":false,\"position\":\"stackedTL\"},
             {\"element\":\"centerBox\",\"visible\":false,\"position\":\"stackedTL\"},
             {\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedTL\"},
             {\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},
             {\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},
         ]}";
       };
     };
   };
 };
}
