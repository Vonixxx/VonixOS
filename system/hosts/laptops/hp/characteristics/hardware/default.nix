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
     device     = "/dev/disk/by-uuid/3C5B-4983";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4";
     device     = "/dev/disk/by-uuid/c101aa16-9be1-482c-b349-2d2a1cf54644";
   };
 };

 boot = { 
   kernelModules        = [ "i915" "kvm-intel" ];
   initrd.kernelModules = [ "vmd" "ahci" "ext4" "nvme" "sd_mod" "xhci_pci" "usb_storage" ];
 };
}
