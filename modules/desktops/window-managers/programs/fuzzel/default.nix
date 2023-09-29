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
     border = {
       width  = 1;
       radius = 10;
     };
     colors = {
       border          = "#81A1C1";
       background      = "#2E3440";
       text            = "#3B4252";
       match           = "#D08770";
       selection       = "#434C5E";
       selection-text  = "#4C566A";
       selection-match = "#D08770";
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
}
