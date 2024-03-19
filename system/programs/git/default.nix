###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ lib
, config
, ...
}:

with lib;

{
 config = mkIf (config.git.enable) {
   home-manager.users.vonix.programs = {
     git.enable                  = true;
     git-credential-oauth.enable = true;
   };
 };
}
