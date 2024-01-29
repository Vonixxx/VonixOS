###########
# VonixOS #
#######################
# Helix Configuration #
#######################
{ lib, config, ... }: with lib;

{
 options.terminal.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.terminal.enable) {
   home-manager.users.vonix.programs = {
     helix = {
       enable         = true;
       settings.theme = "catppuccin_mocha";
     };
   };
 };
}
