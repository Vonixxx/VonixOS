###########
# VonixOS #
#######################
# Kitty Configuration #
#######################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.kitty = {
     enable                                = true;
     shellIntegration.enableZshIntegration = true;
     theme                                 = "Nord";
     font.name                             = "${vars.font}";
   };
 };
}
