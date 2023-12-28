###########
# VonixOS #
#######################
# Helix Configuration #
#######################
{ vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   helix = {
     enable         = true;
     settings.theme = "catppuccin_mocha";
   };
 };
}
