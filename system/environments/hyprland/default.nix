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
           "eDP-1    , 1920x1080@60 , 0x0 , 1"
           "HDMI-A-1 , 2560x1440@75 , 0x0 , 1"
         ];

         misc = {
           force_default_wallpaper      = 0;
           disable_autoreload           = true;
           disable_hyprland_logo        = true;
           animate_manual_resizes       = true;
           animate_mouse_windowdragging = true;
         };

         general = {
           gaps_in                 = 8;
           gaps_out                = 8;
           border_size             = 3;
           cursor_inactive_timeout = 5;
           resize_on_border        = true;
           layout                  = "master";
           "col.active_border"     = "rgb(CBA6F7)";
           "col.inactive_border"   = "rgb(11111B)";
         };

         windowrule = [
           "opacity 0.8 0.8     , ^(foot)$"
           "workspace 3         , ^(rpcs3)$"
           "workspace 5         , ^(evince)$"
           "workspace 1         , ^(firefox)$"
           "workspace 6         , ^(FreeTube)$"
           "nofullscreenrequest , ^(FreeTube)$"
           "workspace 3         , title:^(PCSX2)$"
           "workspace 3         , ^(com.usebottles.bottles)$"
           "workspace 4         , ^(de.haeckerfelix.Fragments)$"
         ];

         bind = [ 
           "SUPER , C , killactive"
           "SUPER , F , fullscreen"

           "SUPER , 1 , workspace , 1"
           "SUPER , 2 , workspace , 2"
           "SUPER , 3 , workspace , 3"
           "SUPER , 4 , workspace , 4"
           "SUPER , 5 , workspace , 5"
           "SUPER , 6 , workspace , 6"

           "SUPER , K , movefocus , u"
           "SUPER , J , movefocus , d"
           "SUPER , H , movefocus , l"
           "SUPER , L , movefocus , r"

           "SUPER SHIFT , 1 , movetoworkspace , 1"
           "SUPER SHIFT , 2 , movetoworkspace , 2"
           "SUPER SHIFT , 3 , movetoworkspace , 3"
           "SUPER SHIFT , 4 , movetoworkspace , 4"
           "SUPER SHIFT , 5 , movetoworkspace , 5"
           "SUPER SHIFT , 6 , movetoworkspace , 6"

           "SUPER , T                     , exec , foot"
           "SUPER , R                     , exec , wofi"
           "SUPER , D                     , exec , evince"
           "SUPER , B                     , exec , firefox"
           "SUPER , Y                     , exec , freetube"
           "SUPER , P                     , exec , fragments"

           "            , XF86MonBrightnessUp   , exec , light -A 5"
           "            , XF86MonBrightnessDown , exec , light -U 5"
           "            , XF86AudioLowerVolume  , exec , amixer -q sset Master 5%-"
           "            , XF86AudioRaiseVolume  , exec , amixer -q sset Master 5%+"
           "            , XF86AudioMute         , exec , amixer -q sset Master 100%-"
           "SUPER       , XF86AudioMute         , exec , amixer -q sset Master 100%+"
           "SUPER_SHIFT , S                     , exec , grimblast save area ~/screenshot.png"
         ];
       };
     };
   };
 };
}
