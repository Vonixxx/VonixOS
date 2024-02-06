###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ config, ... }:

{
 amdcpu.enable = true;
 amdgpu.enable = true;

 fileSystems = {
   "boot" = { 
     fsType     = "vfat";  
     mountPoint = "/boot";
#     device     = "/dev/disk/by-uuid/943B-EF43";
     device     = "/dev/disk/by-label/boot";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4"; 
#     device     = "/dev/disk/by-uuid/72a5d396-e5bd-42d7-b584-f138a12b64f8";
     device     = "/dev/disk/by-label/root";
   };
 };
}
