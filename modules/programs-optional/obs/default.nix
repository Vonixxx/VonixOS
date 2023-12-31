###########
# VonixOS #
#####################
# OBS Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   obs-studio = {
     enable = true;
     plugins = with pkgs.obs-studio-plugins; [
       wlrobs
       obs-backgroundremoval
       obs-pipewire-audio-capture
     ];
   };
 };
}
