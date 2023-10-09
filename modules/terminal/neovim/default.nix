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
     plugins = {
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
       haskell-tools-nvim
     ];
   };
 };
}
