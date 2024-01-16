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
       enable = true;

       settings = {
         monitor = "DP-1, 1920x1080@60, 0x0, 1";

         "$terminal" = "foot";
         "$menu"     = "fuzzel";

         input = {
           sensitivity  = 0;
           kb_layout    = "us";
           follow_mouse = true;
       
           touchpad = {
             natural_scroll = false;
           };
         };

         general = {
           gaps_in       = 5;
           border_size   = 2;
           gaps_out      = 20;
           layout = "dwindle";
           allow_tearing = false;
           col.inactive_border = rgba(595959aa);
           col.active_border   = rgba(33ccffee) rgba(00ff99ee) 45deg;
         };
       };
     };
   };
 };
}
