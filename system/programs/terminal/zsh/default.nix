###########
# VonixOS #
#####################
# ZSH Configuration #
#####################
{ lib
, pkgs
, config
, ...
}: 

with lib;
with pkgs;

{ 
 config = mkIf (config.terminal.enable) {
   users.defaultUserShell = zsh;
   programs.zsh.enable    = true;
   environment.shells     = [ zsh ];

   home-manager.users.vonix.programs = {
     starship = {
       enable               = true;
       enableZshIntegration = true;

       settings = {
         add_newline        = false;
         directory.style    = "bold #a6e3a1";
         git_branch.style   = "bold #f38ba8";
         cmd_duration.style = "bold #f9e2af";

         os = {
           disabled = false;
           style    = "bold #89b4fa";
         };

         format = ''
            [┌](bold #cba6f7)$os$directory$git_branch$git_status$cmd_duration
            [└─](bold #cba6f7)$character
         '';
       };
     };

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
   };
 };
}
