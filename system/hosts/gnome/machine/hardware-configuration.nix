###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ lib, pkgs, config, modulesPath, ... }:

{
 imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

 fileSystems."/boot" = { 
   fsType = "vfat";
   device = "/dev/disk/by-uuid/B18A-8BD8";
 };

 fileSystems."/" = { 
   fsType = "ext4";
   device = "/dev/disk/by-uuid/081d74a4-5d25-4abf-b443-17306c9568a4";
 };

 swapDevices = [ { device = "/dev/disk/by-uuid/cb0fdf3d-d42e-4750-94a5-ced94489b4ef"; } ];

 boot.extraModulePackages           = [ ];
 boot.initrd.kernelModules          = [ ];
 boot.kernelModules                 = [ "kvm-intel" ];
 boot.initrd.availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];

 networking.useDHCP                 = lib.mkDefault true;
 powerManagement.cpuFreqGovernor    = lib.mkDefault "powersave";
 nixpkgs.hostPlatform               = lib.mkDefault "x86_64-linux";
 hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
