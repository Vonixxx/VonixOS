###########
# VonixOS #
#######################
# NixOS Configuration #
#######################
{ config, inputs, pkgs, vars, lib, ... }:

{
 ###########
 # Imports #
 ###########
 imports = ( 
   import ../modules/shell    ++ 
   import ../modules/desktops  
 );


 #########################
 # Allow Unfree Packages #
 #########################
 nixpkgs.config.allowUnfree = true;
 ###################
 # System Packages #
 ###################
 environment.systemPackages = with pkgs; [
   ############
   # Terminal #
   ############
   btop
   coreutils
   git
   killall
   pciutils
   python3Full
   usbutils
   wget
   zsh
   ###############
   # Audio/Video #
   ###############
   feh
   mpv
   pipewire
   pulsemixer
   ################
   # Applications #
   ################
   librewolf
   libreoffice-fresh
   mkpasswd
   mediainfo
   nixos-generators
   pfetch
   spacevim
   ungoogled-chromium
   ##################
   # Virtualisation #
   ##################
   virt-manager
   ###################
   # File Management #
   ###################
   catdoc
   gnutar
   mupdf
   odt2txt
   pigz
   p7zip
   pbzip2
   pandoc
   poppler_utils
   rar
   transmission_4
   unzip
   unrar
 ];

 #########
 # Audio #
 #########
 services.pipewire = {
   enable            = true;
   alsa.enable       = true;
   pulse.enable      = true;
   alsa.support32Bit = true;
 };


 ############
 # Timezone #
 ############
 services.automatic-timezoned = {
   enable = true;
 };


 #########################
 # Environment Variables #
 #########################
 environment = {
   variables = {
     EDITOR   = "${vars.editor}";
     VISUAL   = "${vars.editor}";
     TERMINAL = "${vars.terminal}";
   };
 };


 ###################
 # Locale Settings #
 ###################
 i18n.defaultLocale = "en_GB.UTF-8";
 i18n.extraLocaleSettings = {
   LC_TIME           = "cs_CZ.UTF-8";
   LC_NAME           = "cs_CZ.UTF-8";
   LC_PAPER          = "cs_CZ.UTF-8";
   LC_ADDRESS        = "cs_CZ.UTF-8";
   LC_NUMERIC        = "cs_CZ.UTF-8";
   LC_MONETARY       = "cs_CZ.UTF-8";
   LC_TELEPHONE      = "cs_CZ.UTF-8";
   LC_MEASUREMENT    = "cs_CZ.UTF-8";
   LC_IDENTIFICATION = "cs_CZ.UTF-8";
 };


 ##############
 # Networking #
 ##############
 networking = {
   firewall.enable       = true;
   networkmanager.enable = true;
   hostName              = "VonixOS";
 };


 ############
 # Security #
 ############
 security = {
   rtkit.enable            = true;
   polkit.enable           = true;
   sudo.wheelNeedsPassword = false;
 };


 #################
 # Default Shell #
 #################
 programs.zsh.enable    = true;
 users.defaultUserShell = pkgs.zsh;
 environment.shells     = [ pkgs.zsh ];


 ##################
 # Virtualisation #
 ##################
 programs.dconf.enable          = true;
 virtualisation.libvirtd.enable = true;

 
 #################
 # Video Drivers #
 #################
 hardware.opengl.enable          = true;
 hardware.opengl.driSupport      = true;
 hardware.opengl.driSupport32Bit = true;
 

 ##############
 # uDEV Rules #
 ##############
 services.udev = {
   enable = true;
   packages = [ pkgs.android-udev-rules ];
 };


 ######################
 # Garbage Collection #
 ######################
 nix = {
   settings.auto-optimise-store = true;
   gc = {
     automatic = true;
     dates     = "weekly";
     options   = "--delete-older-than 2d";
   };
 }; 


 ##############
 # Bootloader #
 ##############
 boot = {
   loader.systemd-boot.enable      = true;
   loader.efi.canTouchEfiVariables = true;
   kernelParams                    = [ "quiet" ];
 };


 #############
 # Wallpaper #
 #############
 environment.etc."Stars.jpg".source = /home/${vars.user}/VonixOS/Stars.jpg;

 
 #########
 # Fonts #
 #########
 fonts.packages = with pkgs; [
   line-awesome
   liberation_ttf
   noto-fonts-cjk
   noto-fonts-emoji
   (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
 ];
 
 ##########
 # Flakes #
 ##########
 nix.settings.experimental-features = [ "nix-command" "flakes" ];


 ################
 # User Account #
 ################
 users.users.${vars.user} = {
   isNormalUser   = true;
   extraGroups    = [ "networkmanager" "libvirtd" "wheel" "users" "video" "audio" ];
   hashedPassword = "$6$2apmrKDHbo.NXO.l$R8rgwCFVrbnU5rJDgtb2qMFcbPFqCAdDkm2Mn8sVU.gw9YMGu9oBXZTLdyiybKaiOXaKxdPDeGhQpzccwn93D1";
 };


 #########################
 # Home Manager Settings #
 #########################
 home-manager.users.${vars.user} = {
   home = {
     stateVersion = "23.11";
   };
   programs = {
     home-manager.enable = true;
   };
 };


 #########################################################################
 # Before changing this value read the documentation for this option --> #
 # (e.g. man configuration.nix or https://nixos.org/nixos/options.html). #
 #########################################################################
 system.stateVersion = "23.11"; 
}
