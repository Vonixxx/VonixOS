###########
# VonixOS #
########################
# Neovim Configuration #
########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.nixneovim = {
     enable = true;
   };
 };
}
