###########
# VonixOS #
##########################
# Hyprland Configuration #
##########################
{ lib, config, ... }: with lib;

{
 options.hyprland.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.hyprland.enable) {
   home-manager.users.vonix.wayland.windowManager = {
     hyprland = {
       enable          = true;
       xwayland.enable = true;
     };
   };
 };
}
