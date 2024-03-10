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

{
 config = mkIf (config.general-configuration.enable) {
   programs.dconf.enable                  = true;
   networking.networkmanager.enable       = true;
   hardware.enableRedistributableFirmware = true;
   documentation.nixos.enable             = false;
   system.stateVersion                    = "23.11";
   powerManagement.cpuFreqGovernor        = "ondemand";
   i18n.defaultLocale                     = mkDefault "en_GB.UTF-8";
   nixpkgs.hostPlatform                   = mkDefault "x86_64-linux";

   hardware = {
     pulseaudio.enable = false;

     opengl = {
       enable          = true;
       driSupport      = true;
       driSupport32Bit = true;

       extraPackages = [
         libvdpau-va-gl
         vaapiVdpau
       ];
     };
   };

   security = {
     rtkit.enable            = true;
     polkit.enable           = true;
     sudo.wheelNeedsPassword = false;
   };

   boot = {
     initrd.availableKernelModules = [
       "vmd"
       "ahci"
       "ext4"
       "nvme"
       "sd_mod"
       "usbhid"
       "xhci_pci"
       "sdhci_acpi"
       "usb_storage"
       "rtsx_usb_sdmmc"
     ];

     loader = {
       systemd-boot = {
         configurationLimit = 3;
         enable             = true;
         memtest86.enable   = true;
         editor             = false;
       };

       timeout                  = 5;
       efi.canTouchEfiVariables = true;
       grub.enable              = false;
     };

     tmp.cleanOnBoot      = true;
     supportedFilesystems = [ "ntfs" ];
     kernelParams         = [ "quiet" ];
     kernelPackages       = linuxPackages_latest;
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

   home-manager.users.vonix = {
     programs.home-manager.enable = true;
     home.stateVersion            = "23.11";

     home.pointerCursor = {
       gtk.enable = true;
       package    = catppuccin-cursors.mochaLight;
       name       = "Catppuccin-Mocha-Light-Cursors";
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

   users.users.vonix = {
     uid            = 1000;
     isNormalUser   = true;
     home           = "/home/vonixos";
     extraGroups    = [ "lp" "audio" "video" "wheel" "scanner" "networkmanager" ];
   };

   environment.shellAliases = {
     "update-v.laptop"   = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS#v.laptop' --impure"; 
     "update-v.desktop"  = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS#v.desktop' --impure"; 
     "update-f.libor"    = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS#f.libor' --impure"; 
     "update-f.jarka"    = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS#f.jarka' --impure"; 
     "update-u.ofelia"   = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS#u.ofelia' --impure"; 
     "update-f.stepanka" = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS#f.stepanka' --impure"; 
   };
 };
}
