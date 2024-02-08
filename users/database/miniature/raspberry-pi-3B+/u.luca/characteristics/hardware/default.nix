###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ ... }:

{
 fileSystems = {
   "boot" = { 
     fsType     = "vfat";  
     mountPoint = "/boot";
     device     = "/dev/disk/by-label/boot";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4"; 
     device     = "/dev/disk/by-label/root";
   };
 };
}
