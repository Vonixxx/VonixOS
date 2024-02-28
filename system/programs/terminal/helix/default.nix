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
 config = mkIf (config.terminal.enable) {
   home-manager.users.vonix.programs = {
     helix = {
       enable        = true;
       defaultEditor = true;

       extraPackages = [
         ghc
         haskell-language-server
       ];

       settings = {
         theme = "catppuccin_mocha";

         editor = {
           true-color        = true;
           undercurl         = true;
           whitespace.render.space = "all";
           line-number       = "relative";
         };
       };
     };
   };
 };
}
