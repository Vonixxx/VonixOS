###########
# VonixOS #
##############################
# Cursor-Style Configuration #
##############################
{ vars, unstable, ... }:

{
 home-manager.users.${vars.user} = {
   home.pointerCursor = {
     gtk.enable = true;
     name       = "Catppuccin-Mocha-Light-Cursors";
     package    = pkgs.catppuccin-cursors.mochaLight;
   };
 };
}
