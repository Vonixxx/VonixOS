###########
# VonixOS #
###############
# LSD Styling #
###############
{ config, pkgs, ... }:

{
 home-manager.users.vonix = { pkgs, ... }: {
   programs.lsd = {
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
