###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable            = true;
 recording.enable        = true;
 xdg.portal.enable       = true;
 services.xserver.layout = "cz"; 
}
