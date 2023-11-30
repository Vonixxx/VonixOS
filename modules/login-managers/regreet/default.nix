###########
# VonixOS #
#########################
# Regreet Configuration #
#########################
{ vars, config, ... }:

{
 programs.regreet = {
   enable = true;
   gtk = {
     application_prefer_dark_theme = true;
     icon_theme_name               = "Adwaita";
     theme_name                    = "Adwaita";
     font_name                     = "CascadiaCode 16";
     cursor_theme_name             = "Catppuccin-Mocha-Light-Cursors";
   };
   background = { 
     fit  = "fill";
     path = "/home/${vars.user}/GitHub/VonixOS/modules/wallpapers/Samurai.jpg"; 
   };
 };

 services.greetd = {
   enable                   = true;
   settings.default_session = { command = "${pkgs.greetd.regreet}/bin/regreet --cmd sway"; };
 };
}
