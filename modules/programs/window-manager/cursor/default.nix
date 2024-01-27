###########
# VonixOS #
##############################
# Cursor-Style Configuration #
##############################
{ pkgs, ... }:

{
 environment.variables = { XCURSOR_SIZE = 32; };

 home-manager.users.vonix = {
   home.pointerCursor = {
     size       = 32;
     gtk.enable = true;
     name       = "Catppuccin-Mocha-Light-Cursors";
     package    = pkgs.catppuccin-cursors.mochaLight;
   };
 };
}
