###########
# VonixOS #
#########################
# FireFox Configuration #
#########################
{ stable, arkenfox, ... }:

{
 home-manager.users.vonix = {
   imports = [ arkenfox.hmModules.arkenfox ];

   programs.firefox = {
     enable = true;

     policies = {
       Extensions = {
         Locked = [ "uBlock0@raymondhill.net" ]; 
       };      
     };

     arkenfox = {
       enable = true;
       version = "119.0";
     };

     profiles.default = {
       id = 0;
   
       search = { 
         force   = true;
         default = "DuckDuckGo";
       };
  
       extensions = with stable.nur.repos.rycee.firefox-addons; [
         bitwarden
    	   darkreader
         firefox-color
       ];

       arkenfox = {
         enable        = true;
         "0000".enable = true;
         "0200".enable = true;
         "0300".enable = true;
         "0400".enable = true;
         "0600".enable = true;
         "0700".enable = true;
         "0800".enable = true;
         "1200".enable = true;
         "1600".enable = true;
         "1700".enable = true;
         "2000".enable = true;
         "2400".enable = true;
         "2600".enable = true;
         "2700".enable = true;
         "6000".enable = true;
         "9000".enable = true;
  
         "5000".enable = false;
         "5500".enable = false;
         "7000".enable = false;
         "8000".enable = false;
  
         "0100" = {
           enable                              = true;
           "0102"."browser.startup.page".value = 3;
         };
  
         "0900" = { 
           enable                                        = true;
           "0904"."signon.formlessCapture.enabled".value = true;
         };
  
         "1000" = {
           enable                                   = true;
           "1001"."browser.cache.disk.enable".value = true;
         };
  
         "2800" = {
           enable = true;
  
           "2811" = {
             "privacy.clearOnShutdown.formdata".value     = true;
             "privacy.clearOnShutdown.downloads".value    = true;
             "privacy.clearOnShutdown.cache".value        = false;
             "privacy.clearOnShutdown.history".value      = false;
             "privacy.clearOnShutdown.sessions".value     = false;
             "privacy.clearOnShutdown.siteSettings".value = false;
           };
  
           "2812"."privacy.clearOnShutdown.openWindows".value = false;

           "2815" = {
             "privacy.clearOnShutdown.cookies".value     = false;
             "privacy.clearOnShutdown.offlineApps".value = false;
           };
         };
  
         "4500" = {
           enable = true;

           "4501" = {
             "privacy.resistFingerprinting".value        = false;
             "privacy.resistFingerprinting.pbmode".value = false;
           };

           "4504"."privacy.resistFingerprinting.letterboxing".value = false;
           "4520"."webgl.disabled".value                            = false;
         };
       };
     };
   };
 };
}
