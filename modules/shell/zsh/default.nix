###########
# VonixOS #
#####################
# ZSH Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.zsh = {
     ##########
     # Enable #
     ##########
     enable = true;
     #########
     # ZSHRC #
     #########
     initExtraFirst = ''
        pfetch
     '';
     ##########
     # Prezto #
     ##########
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
     ###########
     # Aliases #
     ###########
     shellAliases = {
       ls        = "lsd";
       cat       = "bat";
       vim       = "spacevim -c 'colorscheme nord'";
       add       = "git add ./";
       commit    = "git commit -a -m";
       push      = "git push -u origin main";
       lapupdate = "sudo nixos-rebuild switch --flake '.#laptop'";
       copy      = "sudo rm -r /etc/nixos/^hardware-configuration.nix(.N) && sudo cp -a -r ~/VonixOS/* /etc/nixos";
     };
   };
 };
}
