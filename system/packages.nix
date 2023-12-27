{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
   ############
   # Standard #
   ############
   coreutils
   efibootmgr
   pciutils
   usbutils
   xdg-utils
   ###############
   # Programming #
   ###############
   ghc
   jdk17
   ######################
   # Terminal Utilities #
   ######################
   git-crypt
   pfetch-rs
   tldr
   wget
   ################
   # Applications #
   ################
   appimage-run
   freetube
   mkpasswd
   mediainfo
   nixos-generators
   youtube-dl
   virt-manager
   when  
 ];
}
