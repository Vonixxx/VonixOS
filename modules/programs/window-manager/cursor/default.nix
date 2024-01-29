###########
# VonixOS #
##############################
# Cursor-Style Configuration #
##############################
{ lib, pkgs, config, ... }: with lib;

{
 options.window-manager.enable = mkOption {
   default = false;
   type    = types.bool;
 };

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
