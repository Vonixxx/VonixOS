###########
# VonixOS #
########################
# Fuzzel Configuration #
########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   fuzzel = {
     enable = true;

     settings = {
       border.width  = 3;

       main = {
         inner-pad      = 3;
         lines          = 10;
         horizontal-pad = 12;
         vertical-pad   = 12;
         icons-enabled  = false;
         prompt         = "Launch --> ";
         font           = "Cascadia Code:size=8";
       };

       colors = {
         match           = "${vars.fuzzel.match}";
         border          = "${vars.fuzzel.border}";
         selection       = "${vars.fuzzel.selection}";
         text            = "${vars.fuzzel.foreground}";
         background      = "${vars.fuzzel.background}";
         selection-match = "${vars.fuzzel.selectionMatch}";
         selection-text  = "${vars.fuzzel.selectionForeground}";
       };
     };
   };
 };
}
