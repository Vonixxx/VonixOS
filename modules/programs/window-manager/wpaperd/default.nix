###########
# VonixOS #
#########################
# wPaperd Configuration #
#########################
{ ... }:

{
 home-manager.users.vonix.programs = {
   wpaperd = {
     enable = true;
     settings = {
       eDP-1.path = "~/GitHub/VonixOS/modules/wallpapers/Whispers.png";
     };
   };
 };
}
