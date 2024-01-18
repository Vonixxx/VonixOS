###########
# VonixOS #
##############################
# Cursor-Style Configuration #
##############################
{ pkgs, ... }:

{
 home-manager.users.vonix = {
   home.pointerCursor = {
     size       = 32;
     gtk.enable = true;
     name       = "Catppuccin-Mocha-Light-Cursors";
     package    = pkgs.catppuccin-cursors.mochaLight;
   };
 };
}
