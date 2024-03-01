###########
# VonixOS #
########################
# Sioyek Configuration #
########################
{ lib
, config
, ...
}: 

with lib;

{
 config = mkIf (config.sioyek.enable) {
   home-manager.users.vonix.programs = {
     sioyek = {
       enable = true; 
  
       config = {
         "default_dark_mode"            = "1";
         "rerender_overview"            = "1";
         "super_fast_search"            = "1";
         "case_sensitive_search"        = "0";
         "check_for_updates_on_startup" = "0";
         "dark_mode_contrast"           = "0.8";
         "ui_font"                      = "CascadiaCode";
       };
     };
   };
 };
}
