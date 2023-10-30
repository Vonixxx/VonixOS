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
       recursion = {
         depth   = 2;
         enabled = true;
       };
       color = {
         when  = "never";
       };
       icons = {
         when  = "always";
       };
       indicators = true;
       layout     = "tree";
       size       = "short";
       sorting = {
         dir-grouping = "first";
       };
     };
   };
 };
}
