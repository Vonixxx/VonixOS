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
   ############
   # Standard #
   ############
   efibootmgr
   xdg-utils
   ###############
   # Programming #
   ###############
   haskell-language-server
   ######################
   # Terminal Utilities #
   ######################
   alsa-utils
   grimblast
   pfetch-rs
   swayimg
   tldr
   wget
   ################
   # Applications #
   ################
   freetube
   mkpasswd
   mediainfo
   nixos-generators
   pulsemixer
   youtube-dl
 ];

 services.udev.packages = [ android-udev-rules ];
}
