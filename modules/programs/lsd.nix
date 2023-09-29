###########
# VonixOS #
#####################
# LSD Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.lsd = {
     ##########
     # Enable #
     ##########
     enable = true;
     ###########
     # Styling #
     ###########
     settings = {
       indicators = true;
       layout     = "tree";
       size       = "short";
       color = {
         when = "never";
       };
       recursion = {
         depth   = 2;
         enabled = true;
       };
       icons = {
         theme = "fancy";
         when  = "always";
       };
       sorting = {
         column       = "name";
         dir-grouping = "first";
       };
     };
   };
 };
}
