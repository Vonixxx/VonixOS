###########
# VonixOS #
#########################################
# System-Specific Package Configuration #
#########################################
{ pkgs
, ...
}:

with pkgs;
with gnome;

{
 environment.systemPackages = [
   ###############
   # Programming #
   ###############
   ghc
   rustc
   ######################
   # Terminal Utilities #
   ######################
   alsa-utils
   du-dust
   efibootmgr
   grimblast
   mediainfo
   pfetch-rs
   pulsemixer
   tldr
   youtube-dl
   xdg-utils
   ################
   # Applications #
   ################
   amberol
   celluloid
   eog
   evince
   fragments
   nautilus
 ];
}
