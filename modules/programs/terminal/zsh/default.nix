###########
# VonixOS #
#####################
# ZSH Configuration #
#####################
{ lib, pkgs, config, ... }: with lib;

{ 
 options.terminal.enable = mkOption {
   default = false;
   type    = types.bool;
 };

 config = mkIf (config.terminal.enable) {
   programs.zsh.enable    = true;
   users.defaultUserShell = with pkgs; zsh;
   environment.shells     = with pkgs; [ zsh ];

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
       settings             = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "/home/vonix/GitHub/VonixOS/modules/programs/terminal/zsh/theme.omp.json"));
     };
   };
 };
}
