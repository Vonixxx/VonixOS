###########
# VonixOS #
#########################################
# System-Specific Package Configuration #
#########################################
{ stable, ... }:

{
 hardware.opengl.extraPackages = with stable; [
   intel-media-driver
   libvdpau-va-gl
   vaapiVdpau 
 ];

 fonts.packages = with stable; [ liberation_ttf ];

 environment.systemPackages = (with stable; [
   coreutils 
   freetube
   libreoffice-fresh
 ]) ++ (with stable.gnomeExtensions; [
    arcmenu
    dash-to-panel
    user-themes
 ]) ++ (with stable.gnome; [ gnome-tweaks ]);

 environment.gnome.excludePackages = with stable.gnome; [
   atomix
   epiphany
   gnome-shell-extensions
   hitori
   iagno
   tali
 ];
}
