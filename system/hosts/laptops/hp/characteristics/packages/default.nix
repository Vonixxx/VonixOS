###########
# VonixOS #
#########################################
# System-Specific Package Configuration #
#########################################
{ pkgs, ... }:

{
 hardware.opengl.extraPackages = with pkgs; [
   intel-media-driver
   libvdpau-va-gl
   vaapiVdpau 
 ];

 fonts.packages = with pkgs; [ liberation_ttf ];

 environment.systemPackages = (with pkgs; [
   coreutils 
   freetube
   libreoffice-fresh
 ]) ++ (with pkgs.gnomeExtensions; [
   arcmenu
   dash-to-panel
   user-themes
 ]) ++ (with pkgs.gnome; [ 
   gnome-tweaks 
 ]) ++ (with pkgs.libsForQt5; [
    kdenlive 
 ]);

 environment.gnome.excludePackages = with pkgs.gnome; [
   atomix
   epiphany
   gnome-shell-extensions
   hitori
   iagno
   tali
 ];
}
