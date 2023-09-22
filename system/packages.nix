############
# VonixOS #
########################
# NixOS Configuration #
######################
{ config, pkgs, ... }:


{
 ####################
 # Unfree Packages #
 ##################
 nixpkgs.config.allowUnfree = true;

 
 ###############################
 # Packages in System Profile #
 #############################
 environment.systemPackages = with pkgs; [
   autotiling
   bat
   bemenu
   catdoc
   git
   gnutar
   greetd.greetd
   greetd.tuigreet
   joshuto
   kitty
   lsd
   light
   librewolf
   libreoffice-fresh
   mako
   mupdf
   mkpasswd
   mediainfo
   neovim
   nixos-generators
   odt2txt
   pigz
   p7zip
   pbzip2
   pfetch
   pandoc
   pulsemixer
   python3Full
   poppler_utils
   rar
   sway
   transmission_4
   unzip
   unrar
   virt-manager
   wget
   waybar
   wlsunset
   wl-clipboard
   zsh
 ];
}
