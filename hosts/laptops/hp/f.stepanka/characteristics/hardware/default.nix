###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ ... }:

{
 intelcpu.enable = true;
 intelgpu.enable = true;

 fileSystems = { 
   "boot" = { 
     fsType     = "vfat";
     mountPoint = "/boot";
     device     = "/dev/disk/by-uuid/3C5B-4983";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4";
     device     = "/dev/disk/by-uuid/c101aa16-9be1-482c-b349-2d2a1cf54644";
   };
 };
}
