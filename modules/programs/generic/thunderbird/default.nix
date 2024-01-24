###########
# VonixOS #
#############################
# Thunderbird Configuration #
#############################
{ ... }:

{
 home-manager.users.vonix.programs = {
   thunderbird = { 
     enable = true;

     profiles.default = {
       isDefault = true;
     };
   };
 };
}
