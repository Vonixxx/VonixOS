###########
# VonixOS #
#########################################
# System-Specific Package Configuration #
#########################################
{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
   freetube
   libreoffice-fresh
 ]; 
}
