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
     ]) ++ (with pkgs.gnome; [
        atomix
        cheese
        epiphany
        geary
        gedit 
        gnome-music
        gnome-terminal
        gnome-characters
        hitori
        iagno
        tali
        totem
     ]); 
   };
 };
}
