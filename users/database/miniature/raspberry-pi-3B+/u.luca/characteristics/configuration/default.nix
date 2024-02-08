###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ ... }:

{
 boot.loader = { 
   generic-extlinux-compatible.enable = true;
   nixpkgs.hostPlatform               = "aarch64-linux";

   raspberryPi = {
     version      = 3;
     enable       = true;
     uboot.enable = true;
   };
 };
}
