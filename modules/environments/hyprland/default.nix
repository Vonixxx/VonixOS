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
         "$terminal" = "foot";
         "$mainMod"  = "SUPER";
         "$menu"     = "fuzzel";

         monitor   = "DP-1, 1920x1080@60, 0x0, 1";
         wallpaper = "DP-1, ~/GitHub/VonixOS/modules/wallpapers/Whispers.png";

         bind = [ 
           "$mainMod, C, killactive"

           "$mainMod, 1, workspace, 1"
           "$mainMod, 2, workspace, 2"
           "$mainMod, 3, workspace, 3"
           "$mainMod, 4, workspace, 4"

           "$mainMod, R, exec, $menu"
           "$mainMod, Q, exec, $terminal"

           "$mainMod, up,    movefocus, k"
           "$mainMod, down,  movefocus, j"
           "$mainMod, left,  movefocus, h"
           "$mainMod, right, movefocus, l"

           "$mainMod SHIFT, 1, movetoworkspace, 1"
           "$mainMod SHIFT, 2, movetoworkspace, 2"
           "$mainMod SHIFT, 3, movetoworkspace, 3"
           "$mainMod SHIFT, 4, movetoworkspace, 4"
         ];

         decorations = {
           rounding = 10;
         };

         input = {
           kb_layout    = "us";
           follow_mouse = true;
       
           touchpad = {
             natural_scroll = false;
           };
         };

         general = {
           gaps_in             = 5;
           border_size         = 2;
           gaps_out            = 20;
           allow_tearing       = false;
           layout              = "master";
           col.inactive_border = "0xffffffff";
           col.active_border   = "0xff444444";
         };
       };
     };
   };
 };
}
