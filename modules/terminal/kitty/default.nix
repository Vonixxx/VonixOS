###########
# VonixOS #
#######################
# Kitty Configuration #
#######################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.kitty = {
     enable = true;
     theme = "Nord";
     font = {
       name = "Cascadia Code";
     };
     shellIntegration.enableZshIntegration = true;
   };
 };
}
