###########
# VonixOS #
#####################
# ZSH Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.oh-my-posh = {
     enable               = true;
     enableZshIntegration = true;
     useTheme             = "agnoster"; 
   };
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
       ########################
       # Alternative Programs #
       ########################
       ls  = "lsd";
       cat = "bat";
       vim = "nvim";
       ####################
       # System Shortcuts #
       ####################
       lapupd  = "nix flake update && sudo nixos-rebuild switch --flake '.#laptop'";
       deskupd = "nix flake update && sudo nixos-rebuild switch --flake '.#desktop'";
     };
   };
 };
}
