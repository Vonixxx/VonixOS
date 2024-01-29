###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable                 = true;
 generic.enable               = true;
 recording.enable             = true;
 xdg.portal.enable            = true;
 general-configuration.enable = true;
 services.xserver.layout      = "cz"; 
}
