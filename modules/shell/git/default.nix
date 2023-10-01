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
     userName  = "${vars.githubuser}";
     userEmail = "${vars.githubemail}";
     delta = {
       enable = true;
       options = {
         delta = {
           side-by-side = true;
           line-numbers = true;
         };
       };
     };
   };
 };
}
