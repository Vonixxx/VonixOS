###########
# VonixOS #
#####################
# ZSH Configuration #
#####################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ./zshrc.nix
   ./prezto.nix
   ./aliases.nix
   ../home-manager/default.nix
 ];


 #######
 # ZSH #
 #######
 home-manager.users.vonix = { pkgs, ... }: {
   programs.zsh = {
     enable = true;
   };
 };
}
