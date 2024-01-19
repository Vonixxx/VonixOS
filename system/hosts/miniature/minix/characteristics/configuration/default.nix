###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ pkgs, ... }:

{
 gnome.enable            = true;
 services.xserver.layout = "cz"; 

 hardware.firmware = {
   pkgs.runCommand "brcm-firmware" { } ''
      mkdir -p $out/lib/firmware/
      cp -r ${./brcm} "$out"/lib/firmware/
   '';
 };
}
