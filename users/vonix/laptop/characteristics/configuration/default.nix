###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ ... }:

{
 services = {
   syncthing = {
     enable = true;
     user = "Vonix";
     dataDir = "/home/vonixos/Synchronized"
   };
   nginx = {
     enable = true;
   };
 };
}
