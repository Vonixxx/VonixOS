###########
# VonixOS #
#######################
# Helix Configuration #
#######################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.helix = {
     enable = true;
   };
 };
}
