###########
# VonixOS #
#########################################
# System-Specific Package Configuration #
#########################################
{ unstable, ... }:

{
 hardware.opengl.extraPackages = with unstable; [
   intel-media-driver
   libvdpau-va-gl
   vaapiVdpau 
 ];

 fonts.packages = with unstable; [ liberation_ttf ];

 environment.systemPackages = (with unstable; [
   coreutils 
   freetube
   libreoffice-fresh
 ]) ++ (with unstable.gnomeExtensions; [
    arcmenu
    burn-my-windows
    dash-to-panel
    user-themes
 ]) ++ (with unstable.gnome; [ gnome-tweaks ]);

 environment.gnome.excludePackages = with unstable.gnome; [
   atomix
   epiphany
   gnome-shell-extensions
   hitori
   iagno
   tali
 ];
}
