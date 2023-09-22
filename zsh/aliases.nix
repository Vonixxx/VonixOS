###########
# VonixOS #
#########################
# Aliases Configuration #
#########################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 ###########
 # Aliases #
 ###########
 home-manager.users.vonix = { pkgs, ... }: {
   programs.zsh = {
     shellAliases = {
       ls     = "lsd";
       cat    = "bat";
       add    = "git add ./";
       vim    = "sudo -E nvim";
       fm     = "sudo -E joshuto";
       commit = "git commit -a -m";
       push   = "git push -u origin main";
       update = "sudo nix-channel --update && sudo nixos-rebuild switch --upgrade";
       copy   = "sudo rm -r /etc/nixos/^hardware-configuration.nix(.N) && sudo cp -a -r ~/VonixOS/* /etc/nixos";
     };
   };
 };
}
