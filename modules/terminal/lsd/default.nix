###########
# VonixOS #
#####################
# LSD Configuration #
#####################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.lsd = {
     enable = true;
     settings = {
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
       indicators = true;
       layout     = "tree";
       size       = "short";
       sorting = {
         column       = "name";
         dir-grouping = "first";
       };
     };
   };
 };
}
