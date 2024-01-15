###########
# VonixOS #
#########################################
# System-Specific Package Configuration #
#########################################
{ stable, ... }:

{
 environment.systemPackages = with stable; [
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

 #######################################
 # Hardware Accelerated Video Playback #
 #######################################
 hardware.opengl.extraPackages = with stable; [
   amdvlk
   libvdpau-va-gl
   vaapiVdpau
 ];

 ############################################################
 # Liberation for Firefox, CascadiaCode for everything else #
 ############################################################
 fonts.packages = with stable; [
   liberation_ttf
   (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
 ];

 #########################################
 # Useful if Customising Android Devices #
 #########################################
 services.udev.packages = with stable; [ android-udev-rules ];
}
