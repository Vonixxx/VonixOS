###########
# VonixOS #
###########################
# BTop Configuration #
###########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.btop = {
     enable = true;
     settings = {
       color_theme = "nord";
     };
   };
 };
}
