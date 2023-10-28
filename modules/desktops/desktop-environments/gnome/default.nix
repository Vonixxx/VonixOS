###########
# VonixOS #
########################
# Budgie Configuration #
########################
{ lib, pkgs, vars, config, ... }:

with lib;
{
 options = {
   gnome = {
     enable = mkOption {
       default = false;
       type    = types.bool;
     };
   };
 };

 config = mkIf (config.gnome.enable) {
   hardware.pulseaudio.enable = false;

   services = {
     xserver = {
       enable                      = true;
       libinput.enable             = true;
       desktopManager.gnome.enable = true;
       displayManager.gdm.enable   = true;
       layout                      = "us";
     };
   };

   environment = { 
     systemPackages = (with pkgs; [
       steam
       steamtinkerlaunch
     ]) ++ (with pkgs.gnomeExtensions; [
        dash-to-panel
     ]);
     gnome.excludePackages = (with pkgs; [
       gnome-tour
       gnome-photos
       gnome-connections
       gnome-text-editor
       mpv
       mupdf
       xterm
     ]) ++ (with pkgs.gnome; [
        atomix
        cheese
	contacts
        epiphany
        geary
        gedit 
        gnome-maps
        gnome-music
        gnome-terminal
        gnome-characters
        hitori
        iagno
	libgnome-keyring
	simple-scan
        tali
        totem
	yelp
     ]); 
   };
 };
}
