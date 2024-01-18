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
         duration     = "30m";
         apply-shadow = false;
         path         = "~/Pictures/Wallpapers"; 
       };
     };
   };
 };
}
