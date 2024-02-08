###########
# VonixOS #
#######################
# Helix Configuration #
#######################
{ lib
, config
, ...
}: 

with lib;
with config;

{
 config = mkIf (terminal.enable) {
   home-manager.users.vonix.programs = {
     helix = {
       enable         = true;
       settings.theme = "catppuccin_mocha";
     };
   };
 };
}
