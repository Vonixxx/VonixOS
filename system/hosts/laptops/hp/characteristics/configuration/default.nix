###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable            = true;
 xdg.portal.enable       = true;
 services.xserver.layout = "cz"; 
}
