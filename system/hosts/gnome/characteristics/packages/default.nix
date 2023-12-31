{ pkgs, ... }:

{
 hardware.opengl.extraPackages = with pkgs; [
   vaapiVdpau 
   libvdpau-va-gl
 ];

 fonts.packages = with pkgs; [ liberation_ttf ];

 environment.systemPackages = (with pkgs; [
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

 environment.gnome.excludePackages = with pkgs.gnome; [
   atomix
   epiphany
   gnome-shell-extensions
   hitori
   iagno
   tali
 ];
}
