###########
# VonixOS #
######################
# When Configuration #
######################
{ pkgs, vars, ... }:

{
 imports = [ /home/vonix/GitHub/Nix-Packages/when/homemanager/when.nix ];
 home-manager.users.${vars.user} = {
   programs.when = {
     enable = true;
   };
 };
}
