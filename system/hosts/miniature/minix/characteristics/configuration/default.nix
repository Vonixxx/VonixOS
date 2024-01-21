###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ pkgs, ... }:

{
 services = { 
   xserver.layout = "cz"; 
   tlp.enable     = false; 
 };

 gnome.enable                     = true;
 powerManagement.cpuFreqGovernor  = "performance";
 i18n.defaultLocale               = "cs_CZ.UTF-8";
}
