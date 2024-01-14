###########
# VonixOS #
######################
# Mako Configuration #
######################
{ ... }:

{
 home-manager.users.vonix.services = {
   mako = {
     enable          = true;
     borderColor     = "#CBA6F7";
     backgroundColor = "#1E1E2E";
     anchor          = "bottom-right";
   };
 };
}
