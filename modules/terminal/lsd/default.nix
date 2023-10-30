###########
# VonixOS #
#####################
# LSD Configuration #
#####################
{ pkgs, vars, ... }:

{
 imports = [ ./colors.yaml ]; 
 home-manager.users.${vars.user} = {
   programs.lsd = {
     enable = true;
     settings = {
       color = {
         when  = "always";
         theme = "custom";
       };
       recursion = {
         depth   = 2;
         enabled = true;
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
