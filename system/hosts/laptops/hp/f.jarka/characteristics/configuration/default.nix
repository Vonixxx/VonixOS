###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ pkgs, ... }:

{
 gnome.enable       = true;
 i18n.defaultLocale = "cs_CZ.UTF-8";

 services = {
   xserver.layout = "cz"; 
   printing = {
     enable          = true;
     browsing        = true;
     openFirewall    = true;
     defaultShared   = true;
     startWhenNeeded = false;

     drivers = with pkgs; [
       cups-bjnp
       carps-cups 
       canon-cups-ufr2
     ];
   };
 };
}
