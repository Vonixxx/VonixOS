###########
# VonixOS #
#############################################################################################################
# System & Home-Manager stateVersion, Learn More: https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion #
#############################################################################################################
{ vars, ... }:

{
 system.stateVersion = "23.11"; 

 home-manager.users.${vars.user} = {
   programs.home-manager.enable = true;
   home.stateVersion            = "23.11";
 };
}
