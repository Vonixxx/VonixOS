###########
# VonixOS #
#####################
# BAT Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.bat = {
     ##########
     # Enable #
     ##########
     enable = true;
     ###########
     # Styling #
     ###########
     config = {
       theme = "base16";
     };
   };
 };
}
