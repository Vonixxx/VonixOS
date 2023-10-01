###########
# VonixOS #
#####################
# BAT Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.bat = {
     enable = true;
     config = {
       theme = "Nord";
     };
   };
 };
}
