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
         palette            = "catppuccin";
         directory.style    = "bold green";
         git_branch.style   = "bold mauve";
         cmd_duration.style = "bold yellow";

         palettes.catppuccin = {
           red    = "f38ba8";  
           blue   = "89b4fa";
           green  = "a6e3a1";  
           mauve  = "cba6f7";  
           yellow = "f9e2af";  
         };

         os = {
           disabled = false;
           style    = "bold blue";
         };

         format = ''
            [┌](bold mauve)$os$directory$git_branch$git_status$cmd_duration
            [└─](bold mauve)$character
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
