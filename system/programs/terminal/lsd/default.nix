###########
# VonixOS #
#####################
# LSD Configuration #
#####################
{ lib
, config
, ...
}: 

with lib;
with config;

{
 config = mkIf (terminal.enable) {
   home-manager.users.vonix.programs = {
     lsd = {
       enable = true;
  
       settings = {
         recursion = {
           depth   = 2;
           enabled = true;
         };
  
         indicators           = true;
         layout               = "tree";
         size                 = "short";
         color.when           = "never";
         sorting.dir-grouping = "first";
         icons.when           = "always";
       };
     };
   };
 };
}
