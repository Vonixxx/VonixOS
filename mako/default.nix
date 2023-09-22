###########
# VonixOS #
######################
# Mako Configuration #
######################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ./styling.nix
   ../home-manager/default.nix
 ];


 ########
 # Mako #
 ########
 home-manager.users.vonix = { pkgs, ... }: {
   services.mako = {
     enable         = true;
     actions        = true;
     defaultTimeout = 1000;
   };
 };
}
