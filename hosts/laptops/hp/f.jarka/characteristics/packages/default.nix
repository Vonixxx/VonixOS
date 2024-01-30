###########
# VonixOS #
#########################################
# System-Specific Package Configuration #
#########################################
{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
   coreutils 
   freetube
   libreoffice-fresh
   system-config-printer
 ]; 
}
