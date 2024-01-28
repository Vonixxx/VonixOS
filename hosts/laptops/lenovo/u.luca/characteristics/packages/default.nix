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
   coreutils
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
   ##############
   # Ergonomics #
   ##############
   autotiling      
 ];

 ############################################################
 # Liberation for Firefox, CascadiaCode for everything else #
 ############################################################
 fonts.packages = with pkgs; [
   liberation_ttf
   (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
 ];

 #########################################
 # Useful if Customising Android Devices #
 #########################################
 services.udev.packages = with pkgs; [ android-udev-rules ];
}
