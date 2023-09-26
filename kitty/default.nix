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
     theme = "Modus Vivendi";
     shellIntegration.enableZshIntegration = true;
     font = {
       name = "Cascadia Code";
     };
   };
 };
}
