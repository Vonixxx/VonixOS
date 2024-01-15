###########
# VonixOS #
######################
# Sway Configuration #
######################
{ lib, config, stable, ... }:

{
 options.sway.enable = lib.mkOption {
   default = false;
   type    = lib.types.bool;
 };

 config = lib.mkIf (config.sway.enable) {
   home-manager.users.vonix.wayland.windowManager = {
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
           "${modifier}+t" = "exec ${stable.foot}/bin/foot";
           "${modifier}+d" = "exec ${stable.fuzzel}/bin/fuzzel";
           "${modifier}+b" = "exec ${stable.firefox}/bin/firefox";
           "${modifier}+y" = "exec ${stable.freetube}/bin/freetube";
           ######################################
           # Switching Containers -> Workspaces #
           ######################################
           "${modifier}+Shift+1" = "move container to workspace number 1";
           "${modifier}+Shift+2" = "move container to workspace number 2";
           "${modifier}+Shift+3" = "move container to workspace number 3";
           "${modifier}+Shift+4" = "move container to workspace number 4";
         };

         output.eDP-1 = { 
           mode = "1920x1080@60Hz"; 
           bg   = "~/GitHub/VonixOS/modules/wallpapers/Whispers.png fill";
         }; 
    
         startup = [ { command = "${stable.autotiling}/bin/autotiling"; always = true; } ];
  
         colors = {
           urgent          = { childBorder = "#F38BA8"; border = "#F38BA8"; background = "#CDD6F4"; text = "#CDD6F4"; indicator = "#F38BA8"; };
           focused         = { childBorder = "#CBA6F7"; border = "#CBA6F7"; background = "#CDD6F4"; text = "#CDD6F4"; indicator = "#CBA6F7"; };
           unfocused       = { childBorder = "#000000"; border = "#000000"; background = "#CDD6F4"; text = "#CDD6F4"; indicator = "#000000"; };
           focusedInactive = { childBorder = "#000000"; border = "#000000"; background = "#CDD6F4"; text = "#CDD6F4"; indicator = "#000000"; };
         };
       };
     };
   };
 };
}
