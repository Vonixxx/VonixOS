###########
# VonixOS # 
#######################
# ZSHRC Configuration #
#######################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 #########
 # ZSHRC #
 #########
 home-manager.users.vonix = { pkgs, ... }: {
   programs.zsh = {
     initExtraFirst = ''
        pfetch
     '';
   };
 };
}
