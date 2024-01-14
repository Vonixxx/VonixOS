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
     device     = "/dev/disk/by-uuid/76FC-D4AA";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4";
     device     = "/dev/disk/by-uuid/f44c64c2-056c-4e1b-854e-7d46dbb531f9";
   };
 };

 boot = { 
   kernelModules        = [ "i915" "kvm-intel" ];
   initrd.kernelModules = [ "vmd" "ahci" "ext4" "nvme" "sd_mod" "xhci_pci" "usb_storage" ];
 };
}
