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
       "custom_background_color" = "0 0 0";  
       "custom_text_color"       = "1.0 1.0 1.0";
     };
   };
 };
}
