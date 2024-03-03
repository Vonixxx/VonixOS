###########
# VonixOS #
#########################################
# System-Specific Package Configuration #
#########################################
{ pkgs
, ... 
}:

with pkgs;

{
 environment.systemPackages = [
   dolphin-emu
   pcsx2
   rpcs3
 ]; 
}
