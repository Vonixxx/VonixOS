###########
# VonixOS #
######################
# When Configuration #
######################
{ lib
, config
, ... 
}: 

with lib;

{
 config = mkIf (config.terminal.enable) {
   home-manager.users.vonix.programs = {
     when.enable = true;
   };
 };
}
