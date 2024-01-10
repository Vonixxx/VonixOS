###########
# VonixOS #
########################
# Sioyek Configuration #
########################
{ vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   sioyek = {
     enable = true; 
   };
 };
}
