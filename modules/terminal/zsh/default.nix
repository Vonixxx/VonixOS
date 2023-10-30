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
       enable = true;
       editor = { keymap = "vi"; };
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
       ########################
       # Alternative Programs #
       ########################
       ls  = "lsd";
       cat = "bat";
       vim = "nvim";
       #######
       # Git #
       #######
       init   = "git init";
       pull   = "git pull";
       add    = "git add ./";
       commit = "git commit -a -m";
       branch = "git branch -M main";
       remote = "git remote add origin";
       push   = "git push -u origin main";
       ####################
       # System Shortcuts #
       ####################
       lupd  = "nix flake update && sudo nixos-rebuild switch --flake '.#laptop' --impure";
       dupd  = "nix flake update && sudo nixos-rebuild switch --flake '.#desktop' --impure";
     };
   };
   programs.oh-my-posh = {
     enable               = true;
     enableZshIntegration = true;
     settings             = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "/home/${vars.user}/GitHub/VonixOS/modules/terminal/zsh/theme/custom.omp.json")); 
   };
 };
}
