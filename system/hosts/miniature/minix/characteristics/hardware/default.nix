###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ pkgs, config, modulesPath, ... }:

{
 imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

 hardware = { 
   cpu.intel.updateMicrocode = true;

   firmware = [ 
     (pkgs.runCommandNoCC "brcm-firmware" { } ''
        mkdir -p $out/lib/firmware/brcm/
        cp ${./brcm/brcmfmac43455-sdio.txt} $out/lib/firmware/brcm/
     '')
   ];
 };

 fileSystems = { 
   "boot" = { 
     fsType     = "vfat";
     mountPoint = "/boot";
     device     = "/dev/disk/by-uuid/DF15-594F";
   };

   "root" = { 
     mountPoint = "/";
     fsType     = "ext4";
     device     = "/dev/disk/by-uuid/605ea3d1-3b08-4e17-b015-43d6c67bdafc";
   };
 };

 boot = { 
   kernelModules        = [ "i915" "kvm-intel" ];
   initrd.kernelModules = [ "vmd" "ahci" "ext4" "nvme" "sd_mod" "usbhid" "xhci_pci" "sdhci_acpi" "usb_storage" ];
 };
}
