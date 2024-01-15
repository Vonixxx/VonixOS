###########
# VonixOS #
########################
# Fuzzel Configuration #
########################
{ ... }:

{
 home-manager.users.vonix.programs = {
   fuzzel = {
     enable = true;

     settings = {
       border.width  = 3;

       colors = {
         text            = "#CDD6F4DD";
         match           = "#F38bA8DD";
         border          = "#CBA6F7DD";
         selection       = "#CDD6F4DD";
         background      = "#181825DD";
         selection-text  = "#CDD6F4DD";
         selection-match = "#F38BA8DD";
       };

       main = {
         inner-pad      = 3;
         lines          = 10;
         horizontal-pad = 12;
         vertical-pad   = 12;
         icons-enabled  = false;
         prompt         = "Launch ->‎";
         font           = "Cascadia Code:size=8";
       };
     };
   };
 };
}
