{ pkgs, ... }:

{
 fonts.packages = with pkgs; [
   liberation_ttf
   (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
 ];

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
}
