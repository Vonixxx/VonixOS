###########
# VonixOS #
########################
# Neovim Configuration #
########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.neovim = {
     enable = true;
     plugins = with pkgs.vimPlugins; [ 
       lazy-nvim
     ];
     extraLuaConfig = "
       local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
       if not vim.loop.fs_stat(lazypath) then
         vim.fn.system({
           'git',
           'clone',
           '--filter=blob:none',
           'https://github.com/folke/lazy.nvim.git',
           '--branch=stable', -- latest stable release
           lazypath,
         })
       end
       vim.opt.rtp:prepend(lazypath)

       require('lazy').setup({
         'doctorfree/nvim-lazyman',
       })
     ";
   };
 };
}
