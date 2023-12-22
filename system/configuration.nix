###########
# VonixOS #
#######################
# NixOS Configuration #
#######################
{ lib, nur, pkgs, sops, vars, config, inputs, arkenfox, home-manager, ... }:

{
 imports = ( 
   import ../modules/desktops ++
   import ../modules/programs ++
   import ../modules/terminal 
 );

 system.stateVersion = "23.11"; 

 home-manager.users.${vars.user} = {
   imports = [ 
     nur.nixosModules.nur 
     arkenfox.hmModules.arkenfox 
     sops.homeManagerModules.sops 
   ];
   programs.home-manager.enable = true;
   home.stateVersion            = "23.11";
 };

 environment.systemPackages = with pkgs; [
   ##################
   # Terminal/Tools #
   ##################
   coreutils
   efibootmgr
   ghc
   pciutils
   pfetch-rs
   tldr
   usbutils
   virt-manager
   wev
   wget
   xdg-utils
   ################
   # Applications #
   ################
   when
   freetube
   libreoffice-fresh
   mkpasswd
   mediainfo
   nixos-generators
   youtube-dl
   youtube-tui
 ];

 programs = {
   zsh.enable   = true;
   dconf.enable = true;
 };

 hardware.opengl = {
   enable          = true;
   driSupport      = true;
   driSupport32Bit = true;

   extraPackages = with pkgs; [
     vaapiVdpau
     libvdpau-va-gl
   ];
 };

 boot.kernelParams = [ "quiet"]; 

 networking = {
   firewall.enable = true;
   wireless = {
     enable = true; 
     networks = {
       O2-Internet-704-5GHz = {
         psk = "54tCXJSj"; 
       }; 
     };
   };
 };

 security = {
   rtkit.enable            = true;
   polkit.enable           = true;
   sudo.wheelNeedsPassword = false;
 };

 i18n.defaultLocale = "en_GB.UTF-8";

 virtualisation.libvirtd.enable = true;

 services = {
   pipewire = {
     enable            = true;
     alsa.enable       = true;
     pulse.enable      = true;
     alsa.support32Bit = true;
   };

   automatic-timezoned.enable = true;

   udev = {
     enable = true;
     packages = with pkgs; [ android-udev-rules ];
   };
 };

 fonts.packages = with pkgs; [
   liberation_ttf
   (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
 ];

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

 environment = {
   shells = with pkgs; [ zsh ];

   variables = {
     VISUAL   = "hx";
     TERMINAL = "hx";
     EDITOR   = "kitty";
     BROWSER  = "firefox";
     PF_INFO  = "ascii title uptime pkgs kernel memory os host";
   };
 };

 users = {
   defaultUserShell = with pkgs; zsh;

   users.${vars.user} = {
     isNormalUser   = true;
     hashedPassword = "${vars.password}";
     extraGroups    = [ "audio" "users" "video" "wheel" "libvirtd" "networkmanager" ];
   };
 };
}
