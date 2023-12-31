###########
# VonixOS #
######################
# Sway Configuration #
######################
{ lib, vars, config, unstable, ... }: with lib;

{
 options.sway.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.sway.enable) {
   home-manager.users.${vars.user}.wayland.windowManager = {
     sway = {
       enable   = true;
       xwayland = true;
  
       config = rec {
         up       = "k";
         down     = "j";
         left     = "l";
         right    = "h";
         modifier = "Mod4";
         window   = { titlebar = false; };
         bars     = [ { command = "waybar"; } ];
         input    = { "*" = { xkb_variant = "us"; }; };
         output   = { ${vars.output} = { mode = "${vars.outputConfig}"; }; };
  
         gaps = {
           top        = 10;
           left       = 10;
           outer      = 10;
           inner      = 10;
           right      = 10;
           bottom     = 10;
           vertical   = 10;
           horizontal = 10;
         };
  
         keybindings = {
           ############
           # Commands #
           ############
           "${modifier}+c" = "kill";
           "${modifier}+r" = "reload";
           "${modifier}+f" = "fullscreen";
           "${modifier}+s" = "mode resize";
           ###################
           # Switching Focus #
           ###################
           "${modifier}+k" = "focus up";
           "${modifier}+h" = "focus left";
           "${modifier}+j" = "focus down";
           "${modifier}+l" = "focus right";
           ######################
           # Switching Position #
           ######################
           "${modifier}+Shift+k" = "move up";
           "${modifier}+Shift+h" = "move left";
           "${modifier}+Shift+j" = "move down";
           "${modifier}+Shift+l" = "move right";
           ########################
           # Switching Workspaces #
           ########################
           "${modifier}+1" = "workspace number 1";
           "${modifier}+2" = "workspace number 2";
           "${modifier}+3" = "workspace number 3";
           "${modifier}+4" = "workspace number 4";
           #####################
           # Program Shortcuts #
           #####################
           "${modifier}+t" = "exec ${unstable.foot}/bin/foot";
           "${modifier}+d" = "exec ${unstable.fuzzel}/bin/fuzzel";
           "${modifier}+b" = "exec ${unstable.firefox}/bin/firefox";
           "${modifier}+y" = "exec ${unstable.freetube}/bin/freetube";
           ######################################
           # Switching Containers -> Workspaces #
           ######################################
           "${modifier}+Shift+1" = "move container to workspace number 1";
           "${modifier}+Shift+2" = "move container to workspace number 2";
           "${modifier}+Shift+3" = "move container to workspace number 3";
           "${modifier}+Shift+4" = "move container to workspace number 4";
         };
  
         startup = [ 
           { command = "${unstable.autotiling}/bin/autotiling"; always = true; } 
           { command = "swaybg -i /home/'${vars.user}'/GitHub/VonixOS/modules/wallpapers/'${vars.staticWallpaper}' -m fill"; always = true; }
         ];
  
         colors = {
           urgent          = { childBorder = "${vars.sway.urgent}";          border = "${vars.sway.urgent}";          background = "${vars.sway.foreground}"; text = "${vars.sway.foreground}"; indicator = "${vars.sway.urgent}"; };
           focused         = { childBorder = "${vars.sway.focusedBorder}";   border = "${vars.sway.focusedBorder}";   background = "${vars.sway.foreground}"; text = "${vars.sway.foreground}"; indicator = "${vars.sway.focusedBorder}"; };
           unfocused       = { childBorder = "${vars.sway.unfocusedBorder}"; border = "${vars.sway.unfocusedBorder}"; background = "${vars.sway.foreground}"; text = "${vars.sway.foreground}"; indicator = "${vars.sway.unfocusedBorder}"; };
           focusedInactive = { childBorder = "${vars.sway.unfocusedBorder}"; border = "${vars.sway.unfocusedBorder}"; background = "${vars.sway.foreground}"; text = "${vars.sway.foreground}"; indicator = "${vars.sway.unfocusedBorder}"; };
         };
       };
     };
   };
 };
}
