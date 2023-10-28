###########
# VonixOS #
########################
# Gnome Configuration #
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
       excludePackages             = [ pkgs.xterm ];
     };
   };

   environment = { 
     systemPackages = (with pkgs; [
       gnome.gnome-tweaks
       orchis-theme
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
       gnome.gnome-contacts
     ]) ++ (with pkgs.gnome; [
        atomix
        cheese
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
	seahorse
	simple-scan
        tali
	yelp
     ]); 
   };
 };
}
