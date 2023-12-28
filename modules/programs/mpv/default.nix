###########
# VonixOS #
#####################
# MPV Configuration #
#####################
{ vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   mpv.enable = true;
 };
}
