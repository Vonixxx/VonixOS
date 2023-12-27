###########
# VonixOS #
#####################
# Git Configuration #
#####################
{ vars, ... }:

{
 home-manager.users.${vars.user}.programs = {
   git-credential-oauth.enable = true;

   git = {
     enable    = true;
     userName  = "Vonixxx";
     userEmail = "vonixxxwork@tuta.io";
   };
 };
}
