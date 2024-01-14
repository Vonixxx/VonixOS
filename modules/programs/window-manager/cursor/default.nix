###########
# VonixOS #
##############################
# Cursor-Style Configuration #
##############################
{ stable, ... }:

{
 home-manager.users.vonix = {
   home.pointerCursor = {
     gtk.enable = true;
     name       = "Catppuccin-Mocha-Light-Cursors";
     package    = stable.catppuccin-cursors.mochaLight;
   };
 };
}
