###########
# VonixOS #
######################
# Mako Configuration #
######################
{ vars, ... }:

{
 home-manager.users.${vars.user}.services = {
   mako = {
     enable          = true;
     borderColor     = "#CBA6F7";
     backgroundColor = "#1E1E2E";
     anchor          = "bottom-right";
   };
 };
}
