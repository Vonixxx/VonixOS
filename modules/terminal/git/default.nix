###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   git = {
     enable    = true;
     userName  = "${vars.githubUser}";
     userEmail = "${vars.githubMail}";
   };

   git-credential-oauth.enable = true;
 };
}
