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

   environment = { 
     systemPackages = (with pkgs; [
       gnome.gnome-tweaks
       steam
       steamtinkerlaunch
     ]) ++ (with pkgs.gnomeExtensions; [
        arcmenu
	burn-my-windows
        dash-to-panel
	forge
	gnome-40-ui-improvements
	space-bar
	transparent-window-moving
     ]);

     gnome.excludePackages = (with pkgs; [
       gnome-tour
       gnome-photos
       gnome-connections
       gnome-text-editor
     ]) ++ (with pkgs.gnome; [
        atomix
        cheese
        epiphany
        geary
        gedit 
        gnome-maps
        gnome-music
	gnome-contacts
        gnome-terminal
        gnome-characters
	gnome-shell-extensions
        hitori
        iagno
	libgnome-keyring
	seahorse
	simple-scan
        tali
	yelp
     ]); 
   };

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
 };
}
