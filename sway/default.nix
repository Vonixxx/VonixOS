###########
# VonixOS #
######################
# Sway Configuration #
######################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ./output.nix
   ./styling.nix
   ./keybindings.nix
 ];


 ########
 # Sway #
 ########
 home-manager.users.vonix = { pkgs, ... }: {
   wayland.windowManager.sway = {
     enable   = true;
     xwayland = true;
   };
 };
}
