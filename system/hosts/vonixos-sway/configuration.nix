###########
# VonixOS #
#######################
# NixOS Configuration #
#######################
{ pkgs, vars, unknown-vars, ... }:

{
 imports = ( 
   import ./characteristics      ++
   import ../../../modules/programs ++
   import ../../../modules/terminal ++
   import ../../../modules/programs-wm
 );

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

 security = {
   rtkit.enable            = true;
   polkit.enable           = true;
   sudo.wheelNeedsPassword = false;
 };

 i18n.defaultLocale = "en_GB.UTF-8";

 boot = { 
   kernelParams = [ "quiet"]; 

   loader = {
     systemd-boot = {
       configurationLimit = 5;
       enable             = true;
     };
 
     timeout                  = 5;
     efi.canTouchEfiVariables = true;
   };
 };

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
     enable   = true;
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

 networking = {
   firewall.enable = true;

   wireless = {
     enable = true; 

     networks = {
       Vonix.psk                = "${unknown-vars.wifi.vonix}"; 
       O2-Internet-704.psk      = "${unknown-vars.wifi.libor}"; 
       O2-Internet-704-5GHz.psk = "${unknown-vars.wifi.libor}"; 
     };
   };
 };

 environment = {
   shells = with pkgs; [ zsh ];

   variables = {
     VISUAL   = "hx";
     EDITOR   = "hx";
     TERMINAL = "kitty";
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
