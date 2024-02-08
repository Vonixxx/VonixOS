###########
# VonixOS #
##########################
# Hardware Configuration #
##########################
{ pkgs
, ... 
}:

with pkgs;

{
 intelcpu.enable           = true;
 intelgpu.enable           = true;
 boot.initrd.kernelModules = [ "sdhci_acpi" ];

 hardware = { 
   firmware = [ 
     (runCommandNoCC "brcm-firmware" { } ''
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
}
