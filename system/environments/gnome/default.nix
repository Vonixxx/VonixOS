###########
# VonixOS #
#######################
# Gnome Configuration #
#######################
{ lib
, pkgs
, config
, ...
}: 

with lib;
with pkgs;
with gnome;
with gnomeExtensions;

{
 config = mkIf (config.gnome.enable) {
   hardware.sane = {
     enable          = true;
     openFirewall    = true;
     brscan4.enable  = true;
     brscan5.enable  = true;
     dsseries.enable = true;

     extraBackends = [
       epkowa
       hplipWithPlugin
       sane-airscan
       utsushi
     ];

     disabledDefaultBackends = [ "escl" ];
   };

   services = {
     ipp-usb.enable = true;

     avahi = {
       enable  = true;
       nssmdns = true;
     };

     printing = {
       enable          = true;
       browsing        = true;
       openFirewall    = true;
       defaultShared   = true;
       startWhenNeeded = false;

       drivers = [
         brlaser 
         brgenml1lpr 
         brgenml1cupswrapper
         gutenprint 
         gutenprintBin
         hplip
         postscript-lexmark
       ];
     };

     xserver = {
       enable                      = true;
       desktopManager.gnome.enable = true;

       displayManager = {
         gdm.enable     = true;
         defaultSession = "gnome";
       };
     };
   };

   environment = { 
     systemPackages = [
       arcmenu
       dash-to-panel
       gnome-tweaks       
       user-themes
     ];

     gnome.excludePackages = [
       atomix
       epiphany
       gnome-shell-extensions
       hitori
       iagno
       tali
     ];
   };

   home-manager.users.vonix = { lib, ... }: with lib.hm.gvariant; {
     dconf.settings = {
       "org/gnome/system/location" = {
         enabled = true;
       };

       "org/gnome/mutter" = {
         edge-tiling = true;
       };

       "org/gnome/desktop/peripherals/touchpad" = {
         tap-to-click   = true;
         natural-scroll = false;
       };

       "org/gnome/desktop/session" = {
         idle-delay = mkUint32 0;
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
         arc-menu-icon                = 15;
         custom-menu-button-icon-size = 50.0;
         hide-overview-on-startup     = true;
         menu-layout                  = "Budgie";
         menu-button-icon             = "Menu_Icon";
       };

       "org/gnome/settings-daemon/plugins/power" = {
         sleep-inactive-battery-type = "nothing";
         sleep-inactive-ac-type      = "nothing";
         power-button-action         = "interactive";
       };

       "org/gnome/settings-daemon/plugins/color" = {
         night-light-schedule-automatic = true;
         night-light-temperature        = mkUint32 1700;
         night-light-enabled            = mkDefault true;
       };

       "org/gnome/desktop/interface" = {
         clock-show-weekday  = true;
         enable-hot-corners  = false;
         font-antialiasing   = "rgba";
         font-hinting        = "full";
         color-scheme        = "prefer-dark";
         monospace-font-name = "Liberation Mono 12";
         font-name           = "Liberation Serif 12";
         document-font-name  = "Liberation Serif 12";
         titlebar-font       = "Liberation Serif Bold 12";
       };

       "org/gnome/desktop/wm/preferences" = {
         num-workspaces = 3;
         button-layout  = "appmenu:minimize,maximize,close";
       };

       "org/gnome/shell" = {
         disable-user-extensions = false;

         disabled-extensions = [ 
           ""
         ];

         favorite-apps = [
           "org.gnome.Nautilus.desktop"
           "firefox.desktop"
           "freetube.desktop"
         ];

         enabled-extensions = [ 
           "arcmenu@arcmenu.com" 
           "dash-to-panel@jderose9.github.com"
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
             {\"element\":\"leftBox\"          ,\"visible\":true  ,\"position\":\"stackedTL\"},
             {\"element\":\"taskbar\"          ,\"visible\":true  ,\"position\":\"stackedTL\"},
             {\"element\":\"systemMenu\"       ,\"visible\":true  ,\"position\":\"stackedBR\"},
             {\"element\":\"dateMenu\"         ,\"visible\":true  ,\"position\":\"stackedBR\"}, 

             {\"element\":\"rightBox\"         ,\"visible\":false ,\"position\":\"stackedTL\"},
             {\"element\":\"centerBox\"        ,\"visible\":false ,\"position\":\"stackedTL\"},
             {\"element\":\"desktopButton\"    ,\"visible\":false ,\"position\":\"stackedTL\"},
             {\"element\":\"showAppsButton\"   ,\"visible\":false ,\"position\":\"stackedTL\"},
             {\"element\":\"activitiesButton\" ,\"visible\":false ,\"position\":\"stackedTL\"}
         ]}";
       };
     };

     programs.firefox = {
       profiles.default.settings."extensions.activeThemeID" = "{f1128560-8b23-46c1-aa6f-fb3e79f23cf3}"; 

       policies.ExtensionSettings."{f1128560-8b23-46c1-aa6f-fb3e79f23cf3}" = {
         installation_mode = "force_installed";          
         install_url       = "https://addons.mozilla.org/firefox/downloads/file/4165370/gnome_adwaita_gtk4_dark-1.1.xpi";
       };
     };
   };
 };
}
