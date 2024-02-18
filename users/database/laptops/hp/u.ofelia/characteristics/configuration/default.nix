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
 services.xserver.layout   = "be"; 
 services.tlp.enable       = false; 
 boot.initrd.kernelModules = [ "xhci_pci" ];

 home-manager.users.vonix = {
   dconf.settings = {
     "org/gnome/desktop/a11y/interface" = {
       high-contrast = true;
     };

     "org/gnome/settings-daemon/plugins/color" = {
       night-light-enabled = false;
     };

     "org/gnome/desktop/interface" = {
       text-scaling-factor = 1.5;
       icon-theme          = "HighContrast";
     };
   };
 };
}
