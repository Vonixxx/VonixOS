###########
# VonixOS #
#########################
# Styling Configuration #
#########################
{ config, pkgs, ... }:

#############
# Variables #
#############
let
 dark = {
    white     = "#FFFFFF";
    base      = "#0C090A";
    black     = "#000000";
    overlay   = "#F88017";
  };
in

{
 ###########
 # Styling #
 ###########
 home-manager.users.vonix = { pkgs, ... }: {
   wayland.windowManager.sway = {
     extraConfig = ''
        exec_always autotiling
        output "*" bg /etc/Stars.jpg fill
     '';
     config = rec {
       gaps = {
         top        = 15;
         left       = 15;
         outer      = 15;
         inner      = 15;
         right      = 15;
         bottom     = 15;
         vertical   = 15;
         horizontal = 15;
       };
       window      = { titlebar = false; };
       bars        = [{ command = "waybar"; }];
       colors = {
         background      = dark.base;
         focused         = { childBorder = dark.white; border = dark.white; background = dark.base; text = dark.white; indicator = dark.white; };
         unfocused       = { childBorder = dark.black; border = dark.black; background = dark.base; text = dark.white; indicator = dark.black; };
         focusedInactive = { childBorder = dark.black; border = dark.black; background = dark.base; text = dark.white; indicator = dark.black; };
         urgent          = { childBorder = dark.white; border = dark.white; background = dark.base; text = dark.white; indicator = dark.overlay; };
         placeholder     = { childBorder = dark.overlay; border = dark.overlay; background = dark.base; text = dark.white; indicator = dark.overlay; };
       };
     };
   };
 };
}
