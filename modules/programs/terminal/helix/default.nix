###########
# VonixOS #
#######################
# Helix Configuration #
#######################
{ lib, config, ... }: with lib;

{
 config = mkIf (config.terminal.enable) {
   home-manager.users.vonix.programs = {
     helix = {
       enable         = true;
       settings.theme = "catppuccin_mocha";
     };
   };
 };
}
