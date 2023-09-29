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
       ls     = "lsd";
       cat    = "bat";
       add    = "git add ./";
       vim    = "sudo -E nvim";
       fm     = "sudo -E joshuto";
       commit = "git commit -a -m";
       push   = "git push -u origin main";
       update = "sudo nixos-rebuild switch --flake '.#vonix'";
       copy   = "sudo rm -r /etc/nixos/^hardware-configuration.nix(.N) && sudo cp -a -r ~/VonixOS/* /etc/nixos";
     };
   };
 };
}
