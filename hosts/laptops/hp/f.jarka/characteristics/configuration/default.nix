###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable                 = true;
 generic.enable               = true;
 general-configuration.enable = true;
 i18n.defaultLocale           = "cs_CZ.UTF-8";

 services = {
   xserver.layout = "cz"; 

   printing = {
     enable          = true;
     browsing        = true;
     openFirewall    = true;
     defaultShared   = true;
     startWhenNeeded = false;
   };
 };

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
