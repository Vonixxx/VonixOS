###########
# VonixOS #
######################
# Foot Configuration #
######################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.foot = {
     enable = true;
     settings = {
       main = {
         term = "xterm-256color";
         font = "CascadiaCode:size=12";
       };
     };
   };
 };
}
