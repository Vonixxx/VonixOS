###########
# VonixOS #
#####################
# ZSH Configuration #
#####################
{ vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   zsh = {
     enable         = true;
     initExtraFirst = "pfetch";

     prezto = {
       enable = true;

       editor = { 
         keymap       = "vi"; 
         dotExpansion = true;
       };

       pmodules = [
         "environment"
         "syntax-highlighting"
         "git"
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

     shellAliases = {
       ls     = "lsd";
       cat    = "bat";
       update = "nix flake update && sudo nixos-rebuild switch --flake '.#lenovo' --impure";
       test   = "nix flake update && sudo nixos-rebuild dry-activate --flake '.#lenovo' --impure";
     };
   };

   oh-my-posh = {
     enable               = true;
     enableZshIntegration = true;
     settings             = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "/home/vonix/GitHub/VonixOS/modules/terminal/zsh/configuration/theme.omp.json"));
   };
 };
}
