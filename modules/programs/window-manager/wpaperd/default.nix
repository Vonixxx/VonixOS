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
       default = { 
         duration     = "5m";
         apply-shadow = false;
         path         = "~/Pictures/Wallpapers"; 
       };
     };
   };
 };
}
