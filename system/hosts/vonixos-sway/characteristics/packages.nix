###########
# VonixOS #
#########################
# Package Configuration #
#########################
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
   ######################
   # Terminal Utilities #
   ######################
   alsa-utils
   git-crypt
   pfetch-rs
   tldr
   wget
   ################
   # Applications #
   ################
   freetube
   mkpasswd
   mediainfo
   nixos-generators
   youtube-dl
   virt-manager
   ##############
   # Ergonomics #
   ##############
   autotiling      
   #######################
   # Screen/Text Capture #
   #######################
   swaybg
   swayimg
 ];

 #######################################
 # Hardware Accelerated Video Playback #
 #######################################
 hardware.opengl.extraPackages = with pkgs; [
   vaapiVdpau
   libvdpau-va-gl
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
