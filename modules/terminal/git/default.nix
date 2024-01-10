###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   git.enable                  = true;
   git-credential-oauth.enable = true;
 };
}
