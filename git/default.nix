###########
# VonixOS #
#####################
# Git Configuration #
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
 # Git #
 #######
 home-manager.users.vonix = { pkgs, ... }: {
   programs.git = {
     enable = true;
   };
   programs.git-credential-oauth = {
     enable = true;
   };
 };
}
