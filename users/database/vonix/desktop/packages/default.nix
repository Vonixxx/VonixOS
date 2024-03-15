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
   lutris
   pcsx2
   rpcs3
 ];
}
