###########
# VonixOS #
#####################
# MPV Configuration #
#####################
{ ...
, lib
, config
}: 

with lib;
with config;

{
 config = mkIf (terminal.enable) {
   home-manager.users.vonix.programs = {
     mpv.enable = true;
   };
 };
}
