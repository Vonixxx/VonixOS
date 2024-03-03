###########
# VonixOS #
#####################
# MPV Configuration #
#####################
{ lib
, pkgs
, config
, ...
}: 

with lib;
with pkgs.mpvScripts;

{
 config = mkIf (config.mpv.enable) {
   home-manager.users.vonix.programs = {
     mpv = {
       enable  = true;
       scripts = [ uosc ];
     };
   };
 };
}
