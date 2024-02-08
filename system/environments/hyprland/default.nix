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
         "$menu"     = "wofi";
         "$terminal" = "foot";
         "$pdf"      = "sioyek";
         "$browser"  = "firefox";
         "$youtube"  = "freetube";

         exec-once = [
           "waybar" 
           "wpaperd"
         ];

         decoration = {
           rounding         = 10;
           active_opacity   = 0.95;
           inactive_opacity = 0.60;
           drop_shadow      = false;
         };

         input = {
           scroll_method = "2fg";
           accel_profile = "adaptive";
         };

         windowrule = [
           "opacity 0.8 override, ^(foot)$"

           "workspace 3         , ^(sioyek)$"
           "opacity 1.0 override, ^(sioyek)$"

           "workspace 1         , ^(firefox)$"
           "opacity 1.0 override, ^(firefox)$"

           "workspace 4         , ^(FreeTube)$"
           "nofullscreenrequest , ^(FreeTube)$"
           "opacity 1.0 override, ^(FreeTube)$"
         ];

         misc = {
           force_default_wallpaper      = 0;
           disable_autoreload           = true;
           disable_hyprland_logo        = true;
           animate_manual_resizes       = true;
           disable_splash_rendering     = true;
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

           "SUPER, P, exec, $pdf"
           "SUPER, D, exec, $menu"
           "SUPER, B, exec, $browser"
           "SUPER, Y, exec, $youtube"
           "SUPER, T, exec, $terminal"

           "SUPER SHIFT, 1, movetoworkspace, 1"
           "SUPER SHIFT, 2, movetoworkspace, 2"
           "SUPER SHIFT, 3, movetoworkspace, 3"
           "SUPER SHIFT, 4, movetoworkspace, 4"

           "SUPER, Print, exec, grimblast save area ~/Pictures/Screenshots/screenshot.png"
         ];
       };
     };
   };
 };
}
