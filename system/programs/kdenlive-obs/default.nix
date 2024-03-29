###########
# VonixOS #
##############################
# KDenlive/OBS Configuration #
##############################
{ lib
, pkgs
, config 
, ...
}: 

with lib;
with pkgs;

{
 config = mkIf (config.kdenlive-obs.enable) {
   home-manager.users.vonix.programs = {
     obs-studio = {
       enable = true;
       plugins = with obs-studio-plugins; [
         obs-backgroundremoval
         obs-pipewire-audio-capture
       ];
     };
   };
  
   environment.systemPackages = with libsForQt5; [
     kdenlive 
   ];
 };
}
