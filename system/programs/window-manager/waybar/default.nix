###########
# VonixOS #
########################
# Waybar Configuration #
########################
{ lib
, config
, ...
}: 

with lib;

{
 imports = [ 
   ./bar.nix
   ./style.nix
 ];

 config = mkIf (config.window-manager.enable) {
   programs.light.enable                           = true;
   home-manager.users.vonix.programs.waybar.enable = true;
 };
}
