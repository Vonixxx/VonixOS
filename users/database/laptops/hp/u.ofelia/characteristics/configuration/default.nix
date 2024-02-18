###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable            = true;
 intelcpu.enable         = true;
 intelgpu.enable         = true;
 services.xserver.layout = "be"; 
 boot.initrd.kernelModules = [ "xhci_pci" ];

 home-manager.users.vonix = {
   dconf.settings = {
     "org/gnome/settings-daemon/plugins/color" = {
       night-light-enabled = false;
     };
   };
 };
}
