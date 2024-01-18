###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ ... }:

{
 home-manager.users.vonix.programs = {
   git.enable                  = true;
   git-credential-oauth.enable = true;
 };
}
