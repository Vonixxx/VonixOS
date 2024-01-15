###########
# VonixOS #
##########################
# Hyprland Configuration #
##########################
{ lib, config, ... }:

{
 options.hyprland.enable = lib.mkOption {
   default = false;
   type    = types.bool;
 };

 config = lib.mkIf (config.hyprland.enable) {
   home-manager.users.vonix.wayland.windowManager = {
     hyprland = {
       enable          = true;
       xwayland.enable = true;
     };
   };
 };
}
