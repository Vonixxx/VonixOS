###########
# VonixOS #
########################
# Neovim Configuration #
########################
{ pkgs, vars, nixneovim, ... }:

{
 programs.nixneovim = {
   enable = true;
 };
}
