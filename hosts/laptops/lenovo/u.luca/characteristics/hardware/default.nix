###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ config, modulesPath, ... }:

{
 imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

 fileSystems = {
   "boot" = { 
     fsType     = "vfat";  
     mountPoint = "/boot";
     device     = "/dev/disk/by-uuid/943B-EF43";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4"; 
     device     = "/dev/disk/by-uuid/72a5d396-e5bd-42d7-b584-f138a12b64f8";
   };
 };
}
