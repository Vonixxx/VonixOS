#builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "/home/vonixos/GitHub/VonixOS/system/programs/terminal/zsh/theme.omp.json"));###########
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
       settings             = ''
 {
 "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
 "blocks": [
   {
    "alignment": "left",
    "segments": [
      {
        "leading_diamond": "",
        "type":            "os",
        "style":           "diamond",
        "background":      "#1E1E2E",
        "foreground":      "#CDD6F4",
        "template":        " {{ if .WSL }}WSL at {{ end }}{{.Icon}} "
      },
      {
        "powerline_symbol": "\ue0b0",
        "background":       "#CBA6F7",
        "foreground":       "#11111B",
        "properties": {
          "folder_icon":           "\uf115",
          "home_icon":             "\ueb06",
          "folder_separator_icon": " \ue0b1 ",
          "style":                 "agnoster"
        },
        "type":     "path",
        "style":    "powerline",
        "template": " {{ .Path }} "
      },
      {
        "properties": {
          "fetch_status":        true,
          "fetch_stash_count":   true
        },
        "type":             "git",
        "powerline_symbol": "\ue0b0",
        "background":       "#A6E3A1",
        "foreground":       "#11111B",
        "style":            "powerline",
        "template":         " {{ .HEAD }}{{ if .Working.Changed }} {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }} {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }} {{ .StashCount }}{{ end }} "
      },
      {
        "type":             "status",
        "powerline_symbol": "\ue0b0",
        "background":       "#F38BA8",
        "foreground":       "#11111B",
        "style":            "powerline",
        "template":         " {{ reason .Code }} "
      }
    ],
    "type": "prompt"
   }
 ],
 "final_space": true,
 "version": 2
}         


       ''; 
     };
   };
 };
}
