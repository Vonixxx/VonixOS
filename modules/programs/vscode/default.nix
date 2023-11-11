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
     haskell = {
       enable = true;
     };
     package = pkgs.vscodium;
   };
 };
}
