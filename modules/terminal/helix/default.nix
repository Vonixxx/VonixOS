###########
# VonixOS #
#######################
# Helix Configuration #
#######################
{ ... }:

{
 home-manager.users.vonix.programs = {
   helix = {
     enable         = true;
     settings.theme = "catppuccin_mocha";
   };
 };
}
