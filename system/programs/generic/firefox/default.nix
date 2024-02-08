###########
# VonixOS #
#########################
# FireFox Configuration #
#########################
{ lib
, config
, ...
}: 

with lib;

{
 imports = [ 
   ./theme.nix
   ./arkenfox.nix
 ];

 config = mkIf (config.generic.enable) {
   home-manager.users.vonix = {
     programs.firefox = {
       enable = true;
  
       profiles.default = {
         search = { 
           force   = true;
           default = "DuckDuckGo";
         };
  
         settings = {
           "ui.systemUsesDarkTheme"                              = 1;
           "toolkit.legacyUserProfileCustomizations.stylesheets" = true; 
         };
       };
  
       policies = {
         DisableProfileImport    = true;
         DisablePocket           = true;
         DisplayBookmarksToolbar = "always";
  
         ExtensionSettings = {
           "addon@darkreader.org" = {
             installation_mode = "normal_installed";          
             install_url       = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
           };
           "uBlock0@raymondhill.net" = {
             installation_mode = "force_installed";          
             install_url       = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
           };
           "{aec77dcc-cbdb-4dac-9a4f-8c6192040aab}" = {
             installation_mode = "normal_installed";          
             install_url       = "https://addons.mozilla.org/firefox/downloads/latest/adwaita-gnome-dark/latest.xpi";
           };
           "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}" = {
             installation_mode = "normal_installed";          
             install_url       = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-mauve/latest.xpi";
           };
           "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
             installation_mode = "normal_installed";          
             install_url       = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
           };
         };      
       };
     };
   };
 };
}
