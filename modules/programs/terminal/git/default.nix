###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ lib, config, ... }: with lib;

{
 options.terminal.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.terminal.enable) {
   home-manager.users.vonix.programs = {
     git.enable                  = true;
     git-credential-oauth.enable = true;
   };
 };
}
