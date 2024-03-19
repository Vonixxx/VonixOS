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
   bottles
   dolphin-emu
   pcsx2
   rpcs3
 ];
}
