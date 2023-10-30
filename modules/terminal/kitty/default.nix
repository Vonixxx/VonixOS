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
     font.name                             = "${vars.font}";
     theme                                 = "${vars.theme}";
   };
 };
}
