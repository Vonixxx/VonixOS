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
   ######################
   # Terminal Utilities #
   ######################
   alsa-utils
   du-dust
   grimblast
   pfetch-rs
   pulsemixer
   tldr
   youtube-dl
   ################
   # Applications #
   ################
   celluloid
   eog
   evince
   fragments
   gnome-calculator
 ];
}
