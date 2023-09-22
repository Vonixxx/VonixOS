###########
# VonixOS #
########################
# Prezto Configuration #
########################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [
   ../home-manager/default.nix
 ];


 ##########
 # Prezto #
 ##########
 home-manager.users.vonix = { pkgs, ... }: {
   programs.zsh = {
     prezto = {
       enable       = true;
       prompt.theme = "adam2";
       editor       = { keymap = "vi"; };
       pmodules = [
         "environment"
         "syntax-highlighting"
         "git"
         "prompt"
         "helper"
         "editor"
         "history"
         "archive"
         "utility"
         "directory"
         "command-not-found"
         "history-substring-search"
         "completion"
         "autosuggestions"
       ];
     };
   };
 };
}
