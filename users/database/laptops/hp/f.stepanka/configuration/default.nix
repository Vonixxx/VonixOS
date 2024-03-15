###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable            = true;
 intelcpu.enable         = true;
 intelgpu.enable         = true;
 xdg.portal.enable       = true;
 kdenlive-obs.enable     = true;
 services.xserver.layout = "cz"; 
}
