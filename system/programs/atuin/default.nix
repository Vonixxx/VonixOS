###########
# VonixOS #
#####################
# Atuin Configuration #
#####################
{ lib
, config
, ...
}: 

with lib;

{
 config = mkIf (config.atuin.enable) {
   home-manager.users.vonix.programs = {
     atuin = {
       enable               = true;
       enableZshIntegration = true;

       settings = {
         inline_height = 10;
         update_check  = false;
         style         = "compact";
         keymap_mode   = "vim-normal";
       };
     };
   };
 };
}
