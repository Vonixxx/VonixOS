###########
# VonixOS #
#######################
# Kitty Configuration #
#######################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.kitty = {
     ##########
     # Enable #
     ##########
     enable = true;
     ###########
     # Styling #
     ###########
     theme = "IR Black";
     ########
     # Font #
     ########
     font = {
       name = "Cascadia Code";
     };
     shellIntegration.enableZshIntegration = true;
   };
 };
}
