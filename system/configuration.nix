###########
# VonixOS #
###############################
# NixOS General Configuration #
#############################################################################################################
# System & Home-Manager stateVersion, Learn More: https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion #
#############################################################################################################
{ lib, pkgs, ... }: with lib;

{
 programs.dconf.enable            = true;
 networking.networkmanager.enable = true; 
 system.stateVersion              = "23.11"; 
 powerManagement.cpuFreqGovernor  = "ondemand";
 nixpkgs.hostPlatform             = "x86_64-linux";
 i18n.defaultLocale               = mkDefault "en_GB.UTF-8";

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

   fstrim.enable                = true;   
   automatic-timezoned.enable   = true;
   power-profiles-daemon.enable = false;
   logind.lidSwitch             = "poweroff";   
   tlp.enable                   = mkDefault true; 
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
   kernelPackages       = pkgs.linuxPackages_latest;
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

 environment.shellAliases = {
   update-hp     = "sudo nix flake update 'github:Vonixxx/VonixOS/flake' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS/flake#hp' --impure"; 
   update-minix  = "sudo nix flake update 'github:Vonixxx/VonixOS/flake' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS/flake#minix' --impure"; 
   update-lenovo = "sudo nix flake update 'github:Vonixxx/VonixOS/flake' && sudo nixos-rebuild boot --no-write-lock-file --flake 'github:Vonixxx/VonixOS/flake#lenovo' --impure"; 
 };
}
