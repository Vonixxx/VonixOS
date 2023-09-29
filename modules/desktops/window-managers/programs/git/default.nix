###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.git = {
     ##########
     # Enable #
     ##########
     enable = true;
   };
   # programs.git-credential-oauth = {
   #   ##########
   #   # Enable #
   #   ##########
   #   enable = true;
   # };
 };
}
