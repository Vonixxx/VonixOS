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
}
