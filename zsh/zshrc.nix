###########
# VonixOS # 
#######################
# ZSHRC Configuration #
#######################
{ config, pkgs, ... }:

{
 home-manager.users.vonix = { pkgs, ... }: {
   programs.zsh = {
     initExtraFirst = ''
        pfetch
     '';
   };
 };
}
