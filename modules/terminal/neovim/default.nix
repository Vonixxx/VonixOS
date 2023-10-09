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
     colorschemes.nord = {
       enable = true;
     };
     mappings = {
       normal = {
         "<leader>s" = {
           silent = true;
	   action = "'<cmd>:x<cr>'";
         };
         "<leader>q" = {
           silent = true;
	   action = "'<cmd>:q<cr>'";
         };
         "<leader>t" = {
           silent = true;
	   action = "'<cmd>:ToggleTerm direction=float<cr>'";
         };
       };
     };
     plugins = {
       telescope = {
         enable = true;
       };
       plenary = {
         enable = true;
       };
       lualine = {
         enable = true;
         theme  = "nord";
       };
       mini = {
         enable            = true;
	 map.enable        = true;
	 basics.enable     = true;
	 animate.enable    = true;
	 surround.enable   = true;
	 cursorword.enable = true;
       };
       treesitter = {
         enable             = true;
         installAllGrammars = true;
       };
     };
     extraPlugins = with pkgs.vimExtraPlugins; [ 
       #################
       # Haskell-Tools #
       #################
       cmp-nvim-lsp
       haskell-tools-nvim
       nvim-cmp
       nvim-toggleterm-lua
     ];
     extraConfigLua = "
       require('toggleterm').setup{}
     ";
   };
 };
}
