###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ config, modulesPath, ... }:

{
 imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

 hardware.cpu.intel.updateMicrocode = true;

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

 boot = { 
   kernelModules        = [ "i915" "kvm-intel" ];
   initrd.kernelModules = [ "vmd" "ahci" "ext4" "nvme" "sd_mod" "sr_mod" "xhci_pci" "usb_storage" "rtsx_usb_sdmmc" ];
 };
}
