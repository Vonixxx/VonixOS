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
         "<leader>f" = {
           silent = true;
	   action = "'<cmd>:Telescope find_files<cr>'";
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
	 theme  = "catppuccin";
       };
       barbar = {
	 enable    = true;
	 clickable = true;
       };
       mini = {
         enable            = true;
	 basics.enable     = true;
	 surround.enable   = true;
	 cursorword.enable = true;
       };
       treesitter = {
         enable             = true;
         installAllGrammars = true;
       };
     };
     extraPlugins = with pkgs.vimExtraPlugins; [ 
       #########
       # Theme #
       #########
       catppuccin
       ##########
       # Barbar #
       ##########
       nvim-web-devicons
       #################
       # Haskell-Tools #
       #################
       cmp-nvim-lsp
       haskell-tools-nvim
       nvim-cmp
     ];
     extraConfigLua = "
       require('catppuccin').setup({
         integrations = {
          treesitter = true,
         }
       })
       vim.cmd.colorscheme 'catppuccin-mocha'
     ";
   };
 };
}
