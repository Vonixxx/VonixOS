###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ pkgs
, ... 
}:

with pkgs;

{
 gnome.enable       = true;
 intelcpu.enable    = true;
 intelgpu.enable    = true;
 i18n.defaultLocale = "cs_CZ.UTF-8";

 services = { 
   xserver.layout = "cz"; 
   tlp.enable     = false; 
 };

 home-manager.users.vonix.programs.firefox.profiles.default.settings = {
   "general.useragent.locale" = "cs-CZ";
   "init.locale.requested"    = "cs,en-US";
 };

 hardware.firmware = [ 
   (runCommandNoCC "brcm-firmware" { } ''
      mkdir -p $out/lib/firmware/brcm/
      cp ${./brcm/brcmfmac43455-sdio.txt} $out/lib/firmware/brcm/
   '')
 ];
}
