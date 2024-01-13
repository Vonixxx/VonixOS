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
 ]) ++ (with pkgs.gnomeExtensions; [
    arcmenu
    burn-my-windows
    dash-to-panel
    space-bar
    user-themes
 ]) ++ (with pkgs.gnome; [ gnome-tweaks ]);

 environment.gnome.excludePackages = with stable.gnome; [
   atomix
   epiphany
   gnome-shell-extensions
   hitori
   iagno
   tali
 ];
}
