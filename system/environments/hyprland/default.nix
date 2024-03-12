###########
# VonixOS #
##########################
# Hyprland Configuration #
##########################
{ lib
, config
, ...
}: 

with lib;

{
 config = mkIf (config.hyprland.enable) {
   home-manager.users.vonix.wayland.windowManager = {
     hyprland = {
       enable = true;

       settings = {
         exec-once = [
           "waybar" 
           "wpaperd"
         ];

         decoration = {
           rounding    = 10;
           drop_shadow = false;
         };

         input = {
           scroll_method = "2fg";
           accel_profile = "adaptive";
         };

         monitor = [
           "eDP-1   , 1920x1080@60, 0x0, 1"
           "HDMI-A-1, 2560x1440@75, 0x0, 1"
         ];

         windowrule = [
           "workspace 5, ^(rpcs3)$"
           "workspace 3, ^(sioyek)$"
           "workspace 1, ^(firefox)$"
           "workspace 4, ^(FreeTube)$"

           "nofullscreenrequest, ^(FreeTube)$"
         ];

         misc = {
           force_default_wallpaper      = 0;
           disable_autoreload           = true;
           disable_hyprland_logo        = true;
           animate_manual_resizes       = true;
           animate_mouse_windowdragging = true;
         };

         general = {
           border_size             = 3;
           cursor_inactive_timeout = 5;
           resize_on_border        = true;
           layout                  = "master";
           "col.active_border"     = "rgb(CBA6F7)";
           "col.inactive_border"   = "rgb(11111B)";
         };

         bind = [ 
           "SUPER, C, killactive"
           "SUPER, F, fullscreen"

           "SUPER, 1, workspace, 1"
           "SUPER, 2, workspace, 2"
           "SUPER, 3, workspace, 3"
           "SUPER, 4, workspace, 4"

           "SUPER, K, movefocus, u"
           "SUPER, J, movefocus, d"
           "SUPER, H, movefocus, l"
           "SUPER, L, movefocus, r"

           "SUPER, T, exec, foot"
           "SUPER, D, exec, wofi"
           "SUPER, P, exec, sioyek"
           "SUPER, B, exec, firefox"
           "SUPER, Y, exec, freetube"

           "SUPER SHIFT, 1, movetoworkspace, 1"
           "SUPER SHIFT, 2, movetoworkspace, 2"
           "SUPER SHIFT, 3, movetoworkspace, 3"
           "SUPER SHIFT, 4, movetoworkspace, 4"
         ];
       };
     };
   };
 };
}
