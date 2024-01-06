###########
# VonixOS #
######################
# Sway Configuration #
######################
{ lib, vars, config, ... }: with lib;

{
 options.hyprland.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.hyprland.enable) {
   home-manager.users.${vars.user}.wayland.windowManager = {
     hyprland = {
       enable          = true;
       xwayland.enable = true;
     };
   };
 };
}
