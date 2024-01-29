###########
# VonixOS #
######################
# Mako Configuration #
######################
{ lib, config, ... }: with lib;

{
 options.window-manager.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.window-manager.enable) {
   home-manager.users.vonix.services = {
     mako = {
       enable          = true;
       borderColor     = "#CBA6F7";
       backgroundColor = "#1E1E2E";
       anchor          = "bottom-right";
     };
   };
 };
}
