###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.git = {
     enable = true;
   };
   programs.git-credential-oauth = {
       enable = true;
   };
 };
}
