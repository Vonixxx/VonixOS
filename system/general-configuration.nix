###########
# VonixOS #
###############################
# NixOS General Configuration #
###############################
{ ... }:

{
 fonts.fontconfig = {
   subpixel.rgba = "rgb";
   hinting.style = "full";
 };

 hardware.opengl = {
   enable          = true;
   driSupport      = true;
   driSupport32Bit = true;
 };

 security = {
   rtkit.enable            = true;
   polkit.enable           = true;
   sudo.wheelNeedsPassword = false;
 };

 i18n.defaultLocale = "en_GB.UTF-8";

 services = {
   pipewire = {
     enable             = true;
     alsa.enable        = true;
     pulse.enable       = true;
     wireplumber.enable = true;
   };

   automatic-timezoned.enable = true;
 };

 boot = { 
   loader = {
     systemd-boot = {
       configurationLimit = 5;
       enable             = true;
       memtest86.enable   = true;
       editor             = false;
     };
 
     timeout                  = 5;
     efi.canTouchEfiVariables = true;
     kernelParams             = [ "quiet" ]; 
   };
 };

 nix = {
   gc = {
     automatic = true;
     dates     = "weekly";
     options   = "--delete-older-than 3d";
   };

   settings = {
     auto-optimise-store   = true;
     experimental-features = [ "nix-command" "flakes" ];
   };
 }; 
}
