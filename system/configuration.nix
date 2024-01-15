###########
# VonixOS #
###############################
# NixOS General Configuration #
#############################################################################################################
# System & Home-Manager stateVersion, Learn More: https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion #
#############################################################################################################
{ lib, stable, ... }: with lib;

{
 programs.dconf.enable             = true;
 networking.networkmanager.enable  = true; 
 system.stateVersion               = "23.11"; 
 powerManagement.cpuFreqGovernor   = "powersave";
 i18n.defaultLocale                = "en_GB.UTF-8";
 nixpkgs.hostPlatform              = "x86_64-linux";


 fonts.fontconfig = {
   allowBitmaps  = false;
   subpixel.rgba = "rgb";
   hinting.style = "full";
 };

 hardware = {
   opengl = {
     enable          = true;
     driSupport      = true;
     driSupport32Bit = true;
   };

   pulseaudio.enable = false;
 };

 security = {
   rtkit.enable            = true;
   polkit.enable           = true;
   sudo.wheelNeedsPassword = false;
 };

 home-manager.users.vonix = {
   programs.home-manager.enable = true;
   home.stateVersion            = "23.11";
 };

 services = {
   pipewire = {
     enable             = true;
     alsa.enable        = true;
     pulse.enable       = true;
     wireplumber.enable = true;
   };

   tlp.enable                   = true; 
   fstrim.enable                = true;   
   automatic-timezoned.enable   = true;
   power-profiles-daemon.enable = false;
   logind.lidSwitch             = "poweroff";   
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
   };

   supportedFilesystems = [ "ntfs" ];
   kernelParams         = [ "quiet" ]; 
   kernelPackages       = stable.linuxPackages_latest;
 };

 nix = {
   optimise.automatic = true;

   gc = {
     automatic = true;
     dates     = "weekly";
     options   = "--delete-older-than 7d";
   };

   settings = {
     auto-optimise-store   = true;
     experimental-features = [ "nix-command" "flakes" ];
   };
 }; 
}
