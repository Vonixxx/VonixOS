###########
# VonixOS #
##########################
# Chromium Configuration #
##########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.chromium = {
     enable = true;
   };
 };
}
