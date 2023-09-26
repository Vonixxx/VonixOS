###########
# VonixOS #
########################
# Neovim Configuration #
########################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 ##########
 # Neovim #
 ##########
 home-manager.users.vonix = { pkgs, ... }: {
   programs.nixneovim = {
     enable = true;
   };
 };
}
