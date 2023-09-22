###########
# VonixOS #
#############################
# Keybindings Configuration #
#############################
{ config, pkgs, ... }:


#############
# Variables #
#############
let
 modifier = config.wayland.windowManager.sway.config.modifier;
 bemenu   = "bemenu-run -i -c -l 20 -W 0.5 -p Run: --fb '#2C3539' --ff '#FFFFFF' --nb '#2C3539' --nf '#FFFFFF' --tb '#2C3539' --hb '#2C3539' --tf '#FFFFFF' --hf '#FF0000' --nf '#FFFFFF' --af '#FFFFFF' --ab '#2C3539'
";
in


###########
# Imports #
###########
{
 imports = [
   ../home-manager/default.nix
 ];


 ###############
 # Keybindings # 
 ###############
 home-manager.users.vonix = { pkgs, ... }: {
   wayland.windowManager.sway = {
     config = rec {
       up       = "k";
       down     = "j";
       left     = "l";
       right    = "h";
       modifier = "Mod4";
       input    = { "*" = { xkb_variant = "us"; }; };
       keybindings = {
         "${modifier}+c"       = "kill";
         "${modifier}+r"       = "reload";
         "${modifier}+f"       = "fullscreen";
         "${modifier}+s"       = "mode resize";
         "${modifier}+k"       = "focus up";
         "${modifier}+h"       = "focus left";
         "${modifier}+j"       = "focus down";
         "${modifier}+l"       = "focus right";
         "${modifier}+Shift+k" = "move up";
         "${modifier}+Shift+h" = "move left";
         "${modifier}+Shift+j" = "move down";
         "${modifier}+Shift+l" = "move right";
         "${modifier}+1"       = "workspace number 1";
         "${modifier}+2"       = "workspace number 2";
         "${modifier}+3"       = "workspace number 3";
         "${modifier}+4"       = "workspace number 4";
         "${modifier}+Shift+1" = "move container to workspace number 1";
         "${modifier}+Shift+2" = "move container to workspace number 2";
         "${modifier}+Shift+3" = "move container to workspace number 3";
         "${modifier}+Shift+4" = "move container to workspace number 4";
         "${modifier}+d"       = "exec ${bemenu}";
         "${modifier}+Return"  = "exec ${pkgs.kitty}/bin/kitty";
         "${modifier}+b"       = "exec ${pkgs.librewolf}/bin/librewolf";
       };
     };
   };
 };
}
