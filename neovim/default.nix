###########
# VonixOS #
########################
# Neovim Configuration #
########################
{ config, pkgs, ... }:


#############
# Variables #
#############
let
 inherit (pkgs) neovim;
in


{
 ###########
 # Imports #
 ###########
 imports = [
   ./plugins.nix
   ./luaconfig.nix
   ../home-manager/default.nix
 ];


 ##########
 # Neovim #
 ##########
 home-manager.users.vonix = { pkgs, ... }: {
   home.sessionVariables = {
     EDITOR = "${neovim}/bin/nvim";
     VISUAL = "${neovim}/bin/nvim";
   };
   programs.neovim = {
     enable = true;
     viAlias = true;
     vimAlias = true;
     vimdiffAlias = true;
   };
 };
}
