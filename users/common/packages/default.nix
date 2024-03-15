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
   du-dust
   evince
   efibootmgr
   freetube
   hidapi
   ghc
   libreoffice-fresh
   mediainfo
   parted
   tldr
   wget
   xdg-utils
 ];
}