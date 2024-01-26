###########
# VonixOS #
##############################
# KDenlive/OBS Configuration #
##############################
{ pkgs, ... }:

{
 home-manager.users.vonix.programs = {
   obs-studio = {
     enable = true;
     plugins = with pkgs.obs-studio-plugins; [
       obs-backgroundremoval
       obs-pipewire-audio-capture
     ];
   };
 };

 environment.systemPackages = with pkgs.libsForQt5; [
   kdenlive 
 ];
}
