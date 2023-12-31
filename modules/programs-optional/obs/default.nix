###########
# VonixOS #
#####################
# OBS Configuration #
#####################
{ vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   obs-studio.enable = true;
 };
}
