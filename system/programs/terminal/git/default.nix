###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ ...
, lib
, config
}: 

with lib;
with config;

{
 config = mkIf (terminal.enable) {
   home-manager.users.vonix.programs = {
     git.enable                  = true;
     git-credential-oauth.enable = true;
   };
 };
}
