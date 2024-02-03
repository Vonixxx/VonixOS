###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable            = true;
 services.xserver.layout = "cz";
 i18n.defaultLocale      = "cs_CZ.UTF-8";

 home-manager.users.vonix = {
   programs.firefox = {
     profiles.default = {
       settings = {
         "general.useragent.locale" = "cs-CZ";
         "init.locale.requested"    = "cs,en-US";
       };
     };
   };
 };
}
