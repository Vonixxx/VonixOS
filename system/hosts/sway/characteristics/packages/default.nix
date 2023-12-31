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
   swaybg
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
   youtube-dl
   virt-manager
   ##############
   # Ergonomics #
   ##############
   autotiling      
 ];

 #######################################
 # Hardware Accelerated Video Playback #
 #######################################
 hardware.opengl.extraPackages = with pkgs; [
   amdvlk
   libvdpau-va-gl
   vaapiVdpau
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
