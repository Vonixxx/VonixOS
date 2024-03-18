###########
# VonixOS #
#######################################
# System-Specific NixOS Configuration #
#######################################
{ ... }:

{
 gnome.enable    = true;
 intelcpu.enable = true;
 intelgpu.enable = true;
 printing.enable = true;

 services = { 
   xserver.layout = "be";
   tlp.enable     = false;
 };

 home-manager.users.vonix = {
   dconf.settings = {
     "org/gnome/desktop/interface" = {
       text-scaling-factor = 1.5;
     };

     "org/gnome/settings-daemon/plugins/color" = {
       night-light-enabled = false;
     };
   };
 };
}
