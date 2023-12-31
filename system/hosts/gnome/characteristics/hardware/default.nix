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
 nixpkgs.hostPlatform               = "x86_64-linux";

 services = { 
   tlp.enable                   = true; 
   power-profiles-daemon.enable = false;
 };

 fileSystems = { 
   "boot" = { 
     fsType     = "vfat";
     mountPoint = "/boot";
     device     = "/dev/disk/by-uuid/B18A-8BD8";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4";
     device     = "/dev/disk/by-uuid/081d74a4-5d25-4abf-b443-17306c9568a4";
   };
 };

 swapDevices = [ { device = "/dev/disk/by-uuid/cb0fdf3d-d42e-4750-94a5-ced94489b4ef"; } ];

 boot = { 
   kernelModules        = [ "kvm-intel" ];
   initrd.KernelModules = [ "vmd" "ahci" "ext4" "nvme" "sd_mod" "xhci_pci" "usb_storage" ];
 };
}
