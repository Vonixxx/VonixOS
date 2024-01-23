###########
# VonixOS #
########################
# Sioyek Configuration #
########################
{ ... }:

{
 home-manager.users.vonix.programs = {
   sioyek = {
     enable = true; 

     config = {
       "default_dark_mode" = true;
       "ui_font"           = "CascadiaCode";
     };
   };
 };
}
