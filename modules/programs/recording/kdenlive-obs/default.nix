###########
# VonixOS #
##############################
# KDenlive/OBS Configuration #
##############################
{ lib, pkgs, config, ... }: with lib;

{
 options.recording.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.recording.enable) {
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
 };
}
