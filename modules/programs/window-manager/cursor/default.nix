###########
# VonixOS #
##############################
# Cursor-Style Configuration #
##############################
{ lib, pkgs, config, ... }: with lib;

{
 config = mkIf (config.window-manager.enable) {
   home-manager.users.vonix = {
     home.pointerCursor = {
       gtk.enable = true;
       name       = "Catppuccin-Mocha-Light-Cursors";
       package    = pkgs.catppuccin-cursors.mochaLight;
     };
   };
 };
}
