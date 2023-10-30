###########
# VonixOS #
########################
# Fuzzel Configuration #
########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.fuzzel = {
     enable = true;
     settings = {
       border = {
         width  = 3;
         radius = 10;
       };
       main = {
         inner-pad      = 3;
         lines          = 10;
         horizontal-pad = 12;
         vertical-pad   = 12;
         fuzzy          = true;
         icons-enabled  = false;
         prompt         = "Launch > ";
         font           = "CascadiaCode:size=8";
       };
       colors = {
         match           = "${vars.fuzzel.match}";
         border          = "${vars.fuzzel.border}";
         selection       = "${vars.fuzzel.selection}";
         background      = "${vars.fuzzel.background}";
         foreground      = "${vars.fuzzel.foreground}";
         selection-match = "${vars.fuzzel.selectionMatch}";
         selection-text  = "${vars.fuzzel.selectionForeground}";
       };
     };
   };
 };
}
