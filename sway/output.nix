###########
# VonixOS #
########################
# Output Configuration #
########################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 ##########
 # Output #
 ##########
 home-manager.users.vonix = { pkgs, ... }: {
   wayland.windowManager.sway = {
     config = rec {
       output = { eDP-1 = { mode = "1920x1080@60Hz"; }; };
     };
   };
 };
}
