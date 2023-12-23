###########
# VonixOS #
#####################
# SSH Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   ssh = {
     enable = true;
   };
 };
}
