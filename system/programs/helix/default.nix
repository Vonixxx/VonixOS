###########
# VonixOS #
#######################
# Helix Configuration #
#######################
{ lib
, pkgs
, config
, ...
}: 

with lib;
with pkgs;

{
 config = mkIf (config.helix.enable) {
   home-manager.users.vonix.programs = {
     helix = {
       enable        = true;
       defaultEditor = true;

       extraPackages = [
         haskell-language-server
         marksman
         nil
         rust-analyzer
       ];

       settings = {
         theme = "catppuccin_mocha";

         editor = {
           true-color              = true;
           undercurl               = true;
           whitespace.render.space = "all";
           line-number             = "relative";
         };
       };
     };
   };
 };
}
