###########
# VonixOS #
###########################
# Mimetypes Configuration #
###########################
{ config, pkgs, ... }:

{
 home-manager.users.vonix = { pkgs, ... }: {
   programs.joshuto = {
     enable = true;
   };
 };
}
