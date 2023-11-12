###########
# VonixOS #
#########################
# VSCode Configuration #
#########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.vscode = {
     enable  = true;
     package = pkgs.vscodium;
     extensions = with pkgs.vscode-extensions; [
       vscodevim.vim
       haskell.haskell
       formulahendry.code-runner
       catppuccin.catppuccin-vsc
       pkief.material-icon-theme
       justusadam.language-haskell
     ];
   };
 };
}
