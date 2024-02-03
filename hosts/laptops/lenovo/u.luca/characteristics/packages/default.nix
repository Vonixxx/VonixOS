###########
# VonixOS #
#########################################
# System-Specific Package Configuration #
#########################################
{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
   ############
   # Standard #
   ############
   efibootmgr
   xdg-utils
   ###############
   # Programming #
   ###############
   ghc
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

 services.udev.packages = with pkgs; [ android-udev-rules ];
}
