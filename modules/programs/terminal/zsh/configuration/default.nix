###########
# VonixOS #
#####################
# ZSH Configuration #
#####################
{ ... }:

{
 home-manager.users.vonix.programs = {
   zsh = {
     enable         = true;
     initExtraFirst = "pfetch";

     shellAliases = {
       ls  = "lsd";
       cat = "bat";
     };

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
   };

   oh-my-posh = {
     enable               = true;
     enableZshIntegration = true;
     settings             = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "/home/vonix/GitHub/VonixOS/modules/terminal/zsh/configuration/theme.omp.json"));
   };
 };
}
