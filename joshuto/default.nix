###########
# VonixOS #
#########################
# Joshuto Configuration #
#########################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ./general.nix
   ./styling.nix
   ./mimetypes.nix
   ./keybindings.nix
 ];


 ###########
 # Joshuto #
 ###########
 home-manager.users.vonix = { pkgs, ... }: {
   programs.joshuto = {
     enable = true;
   };
 };
}
