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
       colors = {
         border          = "#B48EADDD";
         background      = "#4C566ADD";
         text            = "#ECEFF4DD";
         match           = "#BF616ADD";
         selection       = "#2E3440DD";
         selection-text  = "#ECEFF4DD";
         selection-match = "#BF616ADD";
       };
       main = {
         inner-pad      = 3;
         lines          = 10;
         horizontal-pad = 12;
         vertical-pad   = 12;
         fuzzy          = true;
         icons-enabled  = false;
         prompt         = "Launch > ";
         font           = "Cascadia Code:size=8";
       };
     };
   };
 };
}
