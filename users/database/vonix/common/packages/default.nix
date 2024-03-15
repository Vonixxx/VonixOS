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
   ######################
   # Terminal Utilities #
   ######################
   alsa-utils
   grimblast
   parted
   pfetch-rs
   swayimg
   tldr
   ################
   # Applications #
   ################
   mkpasswd
   nixos-generators
   pulsemixer
   youtube-dl
   lutris
 ];
}