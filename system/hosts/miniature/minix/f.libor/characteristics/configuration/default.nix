###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 services = { 
   xserver.layout = "cz"; 
   tlp.enable     = false; 
 };

 gnome.enable       = true;
 i18n.defaultLocale = "cs_CZ.UTF-8";
}
