###########
# VonixOS #
##############################
# Cursor-Style Configuration #
##############################
{ lib
, pkgs
, config
, ...
}: 

with lib;
with pkgs;

{
 config = mkIf (config.window-manager.enable) {
   home-manager.users.vonix = {
     home.pointerCursor = {
       gtk.enable = true;
       package    = catppuccin-cursors.mochaLight;
       name       = "Catppuccin-Mocha-Light-Cursors";
     };
   };
 };
}
