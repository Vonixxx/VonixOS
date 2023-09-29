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
       colors = {
         border          = "#81A1C1DD";
         background      = "#2E3440DD";
         text            = "#3B4252DD";
         match           = "#D08770DD";
         selection       = "#434C5EDD";
         selection-text  = "#4C566ADD";
         selection-match = "#D08770DD";
       };
       main = {
         lines          = 8;
         inner-pad      = 0;
         horizontal-pad = 8;
         vertical-pad   = 40;
         fuzzy          = true;
         icons-enabled  = true;
         prompt         = "Launch >";
         font           = "Cascadia Code:size=12";
       };
     };
   };
 };
}
