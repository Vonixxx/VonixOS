###########
# VonixOS #
#####################
# MPV Configuration #
#####################
{ lib
, config
, ...
}: 

with lib;

{
 config = mkIf (config.mpv.enable) {
   home-manager.users.vonix.programs = {
     mpv.enable = true;
   };
 };
}
