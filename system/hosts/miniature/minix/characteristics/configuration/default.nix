###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ pkgs, ... }:

{
 gnome.enable            = true;
 services.xserver.layout = "cz"; 
 tlp.enable              = false; 
}
