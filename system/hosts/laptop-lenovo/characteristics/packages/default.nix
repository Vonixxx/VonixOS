###########
# VonixOS #
#########################
# Package Configuration #
#########################
{ unstable, ... }:

{
 imports = ( 
   import ./characteristics                         ++
   import ../../../modules/terminal                 ++
   import ../../../modules/environments             ++
   import ../../../modules/programs/generic.nix     ++
   import ../../../modules/programs/window-manager.nix
 );

 environment.systemPackages = with unstable; [
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
   pulsemixer
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
 hardware.opengl.extraPackages = with unstable; [
   amdvlk
   libvdpau-va-gl
   vaapiVdpau
 ];

 ############################################################
 # Liberation for Firefox, CascadiaCode for everything else #
 ############################################################
 fonts.packages = with unstable; [
   liberation_ttf
   (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
 ];

 #########################################
 # Useful if Customising Android Devices #
 #########################################
 services.udev.packages = with unstable; [ android-udev-rules ];
}
