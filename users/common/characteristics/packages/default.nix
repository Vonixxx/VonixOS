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
   efibootmgr
   freetube
   ghc
   libreoffice-fresh
   mediainfo
   parted
   tldr
   wget
   xdg-utils
 ];
}
