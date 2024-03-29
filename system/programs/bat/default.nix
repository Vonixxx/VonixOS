###########
# VonixOS #
#####################
# BAT Configuration #
#####################
{ lib
, pkgs
, config
, ...
}: 

with lib;
with pkgs;

{
 config = mkIf (config.bat.enable) {
   home-manager.users.vonix.programs = {
     bat = {
       enable       = true;
       config.theme = "Catppuccin-Mocha";
  
       themes.Catppuccin-Mocha = {
         file = "Catppuccin-mocha.tmTheme";
  
         src = fetchFromGitHub {
           repo  = "bat";
           owner = "catppuccin";
           rev   = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
           hash  = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
         };
       };
     };
   };
 };
}
