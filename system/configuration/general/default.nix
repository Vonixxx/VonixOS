###########
# VonixOS #
###############################
# NixOS General Configuration #
#############################################################################################################
# System & Home-Manager stateVersion, Learn More: https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion #
#############################################################################################################
{ lib
, pkgs
, config
, ...
}: 

with lib;
with pkgs;
with types;
with config;

{
 options = {
   amdcpu.enable = mkOption {
     type    = bool;
     default = false;
   };

   amdgpu.enable = mkOption {
     type    = bool;
     default = false;
   };

   intelcpu.enable = mkOption {
     type    = bool;
     default = false;
   };

   intelgpu.enable = mkOption {
     type    = bool;
     default = false;
   };

   gnome.enable = mkOption {
     type    = bool;
     default = false;
   };

   generic.enable = mkOption {
     type    = bool;
     default = true;
   };

   hyprland.enable = mkOption {
     type    = bool;
     default = false;
   };

   terminal.enable = mkOption {
     type    = bool;
     default = false;
   };

   recording.enable = mkOption {
     type    = bool;
     default = false;
   };

   window-manager.enable = mkOption {
     type    = bool;
     default = false;
   };

   general-configuration.enable = mkOption {
     type    = bool;
     default = true;
   };
 };

 config = mkIf (general-configuration.enable) {
   programs.dconf.enable                  = true;
   networking.networkmanager.enable       = true; 
   hardware.enableRedistributableFirmware = true;
   system.stateVersion                    = "23.11"; 
   powerManagement.cpuFreqGovernor        = "ondemand";
   nixpkgs.hostPlatform                   = "x86_64-linux";
   i18n.defaultLocale                     = mkDefault "en_GB.UTF-8";
  
   hardware = {
     opengl = {
       enable          = true;
       driSupport      = true;
       driSupport32Bit = true;
  
       extraPackages = [
         libvdpau-va-gl
         vaapiVdpau
       ];
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
       jack.enable        = true;
       pulse.enable       = true;
       alsa.support32Bit  = true;
       wireplumber.enable = true;
     };
  
     fstrim.enable                = true;   
     automatic-timezoned.enable   = true;
     power-profiles-daemon.enable = false;
     logind.lidSwitch             = "poweroff";   
     tlp.enable                   = mkDefault true; 
   };
  
   boot = { 
     initrd.kernelModules = [
       "ahci"
       "ext4"
       "nvme"
       "sd_mod"
       "usbhid"
       "usb_storage"
     ];
  
     loader = {
       systemd-boot = {
         configurationLimit = 10;
         enable             = true;
         memtest86.enable   = true;
         editor             = false;
       };
   
       timeout                  = 5;
       efi.canTouchEfiVariables = true;
     };
  
     tmp.cleanOnBoot      = true;
     supportedFilesystems = [ "ntfs" ];
     kernelParams         = [ "quiet" ]; 
     kernelPackages       = linuxPackages_latest;
   };
  
   nix = {
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
  
   fonts = {
     fontconfig = {
       allowBitmaps  = false;
       subpixel.rgba = "rgb";
       hinting.style = "full";
     };

     packages = [
       liberation_ttf
       (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
     ];
   };
  
   environment.shellAliases = {
     "update-u.luca"     = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS#u.luca' --impure"; 
     "update-f.libor"    = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS#f.libor' --impure"; 
     "update-f.jarka"    = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS#f.jarka' --impure"; 
     "update-f.stepanka" = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS#f.stepanka' --impure"; 
   };
 };
}
