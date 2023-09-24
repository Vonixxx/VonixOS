###########
# VonixOS #
##############################
# Home Manager Configuration #
##############################
{ config, pkgs, ... }:

#############
# Variables #
#############
let
 home-manager  = builtins.fetchTarball home-manager-source;
 home-manager-source = {
   sha256 = "0wb5bxxx7isqcgzcfg8a6pl7hwkzl3z0rnbr9vjzvxrs4vz53366";
   url    = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
 };
in


{
 ###########
 # Imports #
 ###########
 imports = [
   (import "${home-manager}/nixos")
 ];


 ########################
 # Home Manager Version #
 ########################
 home-manager.users.vonix = { pkgs, ... }: {
   home.stateVersion = "23.05";
 };
}
