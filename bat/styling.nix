###########
# VonixOS #
###############
# BAT Styling #
###############
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   #../home-manager/default.nix
 ];


 #######
 # BAT #
 #######
 home-manager.users.vonix = { pkgs, ... }: {
   programs.bat = {
     config = {
       theme = "base16";
     };
   };
 };
}
