###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ config, modulesPath, ... }:

{
 imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

 hardware.cpu.amd.updateMicrocode = true;
 powerManagement.cpuFreqGovernor  = "performance";
 nixpkgs.hostPlatform             = "x86_64-linux";

 fileSystems = {
   "boot" = { 
     fsType     = "vfat";  
     mountPoint = "/boot";
     device     = "/dev/disk/by-uuid/EE31-FF53";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4"; 
     device     = "/dev/disk/by-uuid/2a021762-c965-468e-a030-3bc494450aad";
   };
 };

 boot = {
   kernelModules        = [ "amdgpu" "kvm-amd" ];
   initrd.kernelModules = [ "ahci" "ext4" "nvme" "sd_mod" "xhci_pci" "usb_storage" ];
 };
}
