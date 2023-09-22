###########
# VonixOS #
##################
# Neovim Plugins #
##################
{ config, pkgs, ... }:

{
 ############
 # Imports #
 ##########
 imports = [
   ../home-manager/default.nix
 ];


 ###########
 # Plugins #
 ###########
 home-manager.users.vonix = { pkgs, ... }: {
   programs.neovim = {
     plugins = with pkgs.vimPlugins; [
       vim-nix
       lualine-nvim
       onedarkpro-nvim
       nvim-treesitter.withAllGrammars
     ];
   };
 };
}
