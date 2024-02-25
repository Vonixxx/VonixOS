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
         add_newline = false;
         palette     = "catppuccin";

         palettes.catppuccin = {
           red    = "#F38BA8";  
           blue   = "#89B4FA";
           green  = "#A6E3A1";  
           mauve  = "#CBA6F7";  
           yellow = "#F9E2AF";  
         };

         os = {
           disabled = false;
           style    = "bold blue";
           symbols  = { NixOS = "󰜗 "; };
         };

         directory = {
           read_only       = "󰷤";
           read_only_style = "bold red";
           style           = "bold green";
         };

         cmd_duration = {
           style  = "bold yellow";
           format = "[$duration]($style) ";
         };

         git_branch = {
           style   = "bold mauve";
           format  = "[$symbol$branch(:$remote_branch)]($style) ";
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
