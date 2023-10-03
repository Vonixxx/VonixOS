###########
# VonixOS #
###########################
# Librewolf Configuration #
###########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.btop = {
     enable = true;
   };
 };
}
