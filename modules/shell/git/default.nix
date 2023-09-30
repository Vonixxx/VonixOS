###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.git = {
     enable    = true;
     userName  = "${vars.githubuser}";
     userEmail = "${vars.githubemail}";
   };
   programs.git-credential-oauth = {
     enable = true;
   };
 };
}
