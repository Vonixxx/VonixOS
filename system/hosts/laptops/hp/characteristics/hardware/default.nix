###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ config, modulesPath, ... }:

{
 imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

 hardware.cpu.intel.updateMicrocode = true;
 powerManagement.cpuFreqGovernor    = "powersave";

 fileSystems = { 
   "boot" = { 
     fsType     = "vfat";
     mountPoint = "/boot";
     device     = "/dev/disk/by-uuid/3189-2D45";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4";
     device     = "/dev/disk/by-uuid/fba8b85a-e7c6-4637-ad79-06d376f77f99";
   };
 };

 boot = { 
   kernelModules        = [ "i915" "kvm-intel" ];
   initrd.kernelModules = [ "vmd" "ahci" "ext4" "nvme" "sd_mod" "xhci_pci" "usb_storage" ];
 };
}
