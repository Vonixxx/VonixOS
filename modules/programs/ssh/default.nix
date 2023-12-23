###########
# VonixOS #
#####################
# SSH Configuration #
#####################
{ pkgs, vars, ... }:

{
 services.sshd.enable = true;

 home-manager.users.${vars.user}.programs = {
   ssh = {
     enable = true;
   };
 };
}
