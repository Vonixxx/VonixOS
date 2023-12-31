###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ config, modulesPath, ... }:

{
 imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

 hardware.cpu.amd.updateMicrocode = true;
 powerManagement.cpuFreqGovernor  = "powersave";
 nixpkgs.hostPlatform             = "x86_64-linux";

 services.tlp.settings = {
   enable              = true;
   auto-cpufreq.enable = true;
 };

 fileSystems."/boot" = { 
   fsType = "vfat";  
   device = "/dev/disk/by-uuid/943B-EF43";
 };

 fileSystems."/" = { 
   fsType = "ext4"; 
   device = "/dev/disk/by-uuid/72a5d396-e5bd-42d7-b584-f138a12b64f8";
 };

 boot = {
   kernelmodules                 = [ "kvm-amd" ];
   initrd.availablekernelmodules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
 };
}
