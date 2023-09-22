###########
# VonixOS #
#####################
# Lua Configuration #
#####################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 #######
 # Lua #
 #######
 home-manager.users.vonix = { pkgs, ... }: {
   programs.neovim = {
     extraLuaConfig = ''
        vim.opt.mouse = 'a'
        vim.opt.wrap = true
        vim.opt.number = true
        vim.opt.hlsearch = true
        vim.opt.showmatch = true
        vim.opt.incsearch = true
        vim.opt.smartcase = true
        vim.opt.ignorecase = true
	vim.opt.relativenumber = true
	vim.opt.clipboard = "unnamedplus"
	vim.cmd("colorscheme onedark_dark")
     '';
   };
 };
}
