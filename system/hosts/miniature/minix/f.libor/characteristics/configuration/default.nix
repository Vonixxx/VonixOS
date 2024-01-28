###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable       = true;
 i18n.defaultLocale = "cs_CZ.UTF-8";

 services = { 
   xserver.layout = "cz"; 
   tlp.enable     = false; 
 };

 home-manager.users.vonix = {
   programs.firefox = {
     profiles.default = {
       settings = {
         "general.useragent.locale" = "cs-CZ";
       };
     };
   };
 };
}
