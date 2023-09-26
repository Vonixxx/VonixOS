###########
# VonixOS #
#######################
# NixOS Configuration #
#######################
{ config, pkgs, ... }:

{
 ###########
 # Imports #
 ###########
 imports = [ 
   ############
   # Programs #
   ############
   ./bat/default.nix
   ./git/default.nix
   ./lsd/default.nix
   ./zsh/default.nix
   ./tlp/default.nix
   ./sway/default.nix
   ./mako/default.nix
   ./kitty/default.nix
   #./neovim/default.nix
   ./waybar/default.nix
   ./joshuto/default.nix
   ./wlsunset/default.nix
   ./home-manager/default.nix
   ./login-manager/default.nix
   ###############
   # Base System #
   ###############
   ./system/packages.nix
   ./hardware-configuration.nix
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
 security.rtkit.enable = true;


 #####################
 # Backlight Control #
 #####################
 programs.light.enable = true;


 ############
 # Timezone #
 ############
 services.automatic-timezoned = {
   enable = true;
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
   hostName              = "Nix";
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

 
 #######################################
 # Wayland Requirements + Video Driver #
 #######################################
 security.polkit.enable          = true;
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
     options   = "--delete-older-than 7d";
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
 environment.etc."Stars.jpg".source = ./Stars.jpg;

 
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
 users.users.vonix = {
   isNormalUser   = true;
   description    = "Vonix";
   home           = "/home/vonix";
   extraGroups    = [ "networkmanager" "users" "wheel" "video" "libvirtd" ];
   hashedPassword = "$6$2apmrKDHbo.NXO.l$R8rgwCFVrbnU5rJDgtb2qMFcbPFqCAdDkm2Mn8sVU.gw9YMGu9oBXZTLdyiybKaiOXaKxdPDeGhQpzccwn93D1";
 };


 #########################################################################
 # Before changing this value read the documentation for this option --> #
 # (e.g. man configuration.nix or https://nixos.org/nixos/options.html). #
 #########################################################################
 system.stateVersion = "23.05"; 
}
