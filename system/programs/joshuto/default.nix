###########
# VonixOS #
#########################
# Joshuto Configuration #
#########################
{ lib
, config
, ...
}: 

with lib;

{
 config = mkIf (config.joshuto.enable) {
   home-manager.users.vonix.programs = {
     joshuto = {
       enable = true;
     };
   };
 };
}
