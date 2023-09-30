###########
# VonixOS #
#####################
# ZSH Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.zsh = {
     enable = true;
     initExtraFirst = ''
        pfetch
     '';
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
     shellAliases = {
       ls        = "lsd";
       cat       = "bat";
       add       = "git add ./";
       commit    = "git commit -a -m";
       push      = "git push -u origin main";
       vim       = "spacevim -c 'colorscheme nord'";
       lapupd    = "nix flake update && sudo nixos-rebuild switch --flake '.#laptop'";
       deskupd   = "nix flake update && sudo nixos-rebuild switch --flake '.#desktop'";
     };
   };
 };
}
