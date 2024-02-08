###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ ... }:

{
 amdcpu.enable = true;
 amdgpu.enable = true;

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
