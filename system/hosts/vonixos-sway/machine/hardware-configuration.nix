##################
# Do Not Modify! #
##################
{ lib, pkgs, config, modulesPath, ... }:

{
 imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

 fileSystems."/boot" = { 
   fsType = "vfat";  
   device = "/dev/disk/by-uuid/943B-EF43";
 };

 fileSystems."/" = { 
   fsType = "ext4"; 
   device = "/dev/disk/by-uuid/72a5d396-e5bd-42d7-b584-f138a12b64f8";
 };

 boot.extraModulePackages           = [ ];
 boot.initrd.kernelModules          = [ ];
 boot.kernelModules                 = [ "kvm-amd" ];
 boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];

 networking.useDHCP               = lib.mkDefault true;
 nixpkgs.hostPlatform             = lib.mkDefault "x86_64-linux";
 hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
