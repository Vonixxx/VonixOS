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
     anchor          = "bottom-right";
     borderColor     = "${vars.mako.border}";
     backgroundColor = "${vars.mako.background}";
   };
 };
}
