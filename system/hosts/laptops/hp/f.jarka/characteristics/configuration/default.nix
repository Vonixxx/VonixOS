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
       cnijfilter2
       canon-cups-ufr2
       cnijfilter_2_80
       cnijfilter_4_00
       (writeTextDir "share/cups/model/LBP2900.ppd" (builtins.readFile ./canon/LBP2900.ppd))
     ];
   };
 };
}
