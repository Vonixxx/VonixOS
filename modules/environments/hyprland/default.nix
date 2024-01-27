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
         "$menu"     = "wofi";
         "$terminal" = "foot";
         "$pdf"      = "sioyek";
         "$browser"  = "firefox";
         "$youtube"  = "freetube";
         monitor     = "eDP-1, 1920x1080@60, 0x0, 1";

         exec-once = [
           "mako" 
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
           "$mainMod, C, killactive"
           "$mainMod, F, fullscreen"

           "$mainMod, 1, workspace, 1"
           "$mainMod, 2, workspace, 2"
           "$mainMod, 3, workspace, 3"
           "$mainMod, 4, workspace, 4"

           "$mainMod, K, movefocus, u"
           "$mainMod, J, movefocus, d"
           "$mainMod, H, movefocus, l"
           "$mainMod, L, movefocus, r"

           "$mainMod, P, exec, $pdf"
           "$mainMod, D, exec, $menu"
           "$mainMod, B, exec, $browser"
           "$mainMod, Y, exec, $youtube"
           "$mainMod, T, exec, $terminal"

           "$mainMod SHIFT, 1, movetoworkspace, 1"
           "$mainMod SHIFT, 2, movetoworkspace, 2"
           "$mainMod SHIFT, 3, movetoworkspace, 3"
           "$mainMod SHIFT, 4, movetoworkspace, 4"

           "$mainMod, Print, exec, grimblast save area ~/Pictures/Screenshots/screenshot.png"
         ];
       };
     };
   };
 };
}
