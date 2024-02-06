###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ ... }:

{
 intelcpu.enable           = true;
 intelgpu.enable           = true;
 boot.initrd.kernelModules = [ "rtsx_usb_sdmmc" ];

 fileSystems = { 
   "boot" = { 
     fsType     = "vfat";
     mountPoint = "/boot";
     device     = "/dev/disk/by-uuid/F673-D531";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4";
     device     = "/dev/disk/by-uuid/a34b2349-0770-4bf8-8d7e-ee6b6ae24eac";
   };
 };
}
