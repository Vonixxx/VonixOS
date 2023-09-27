###########
# VonixOS #
#######################
# Kitty Configuration #
#######################
{ config, pkgs, ... }:

{
 home-manager.users.vonix = { pkgs, ... }: {
   programs.kitty = {
     enable = true;
     theme = "IR Black";
     shellIntegration.enableZshIntegration = true;
     font = {
       name = "Cascadia Code";
     };
   };
 };
}
