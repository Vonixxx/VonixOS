###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.git-credential-oauth = {
     enable = true;
   };
   programs.git = {
     enable    = true;
     userName  = "${vars.githubUser}";
     userEmail = "${vars.githubMail}";
   };
 };
}
