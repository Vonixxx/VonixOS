###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ config, pkgs, ... }:

{
 home-manager.users.vonix = { pkgs, ... }: {
   programs.git = {
     enable = true;
   };
   programs.git-credential-oauth = {
     enable = true;
   };
 };
}
