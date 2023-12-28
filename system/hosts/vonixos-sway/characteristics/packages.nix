{ pkgs, ... }:

{
 environment.loginShellInit = ''
    if [ "$(tty)" = "/dev/tty1" ]; then
      exec sway
    fi
 '';
 
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
