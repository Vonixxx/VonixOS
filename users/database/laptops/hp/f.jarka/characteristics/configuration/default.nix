###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable              = true;
 intelcpu.enable           = true;
 intelgpu.enable           = true;
 services.xserver.layout   = "cz";
 services.tlp.enable       = false; 
 i18n.defaultLocale        = "cs_CZ.UTF-8";
 boot.initrd.kernelModules = [ "rtsx_usb_sdmmc" ];

 home-manager.users.vonix = {
   programs.firefox = {
     profiles.default = {
       settings = {
         "general.useragent.locale" = "cs-CZ";
         "init.locale.requested"    = "cs,en-US";
       };
     };
   };
 };
}
