#############
# VanillaOS #
#######################
# NixOS Configuration #
#######################
{ pkgs, vars, unknown-vars, ... }:

{
 imports = ( 
   import ./characteristics      ++
   import ../../../modules/programs 
 );

 programs.dconf.enable = true;

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
   sudo.wheelNeedsPassword = true;
 };

 i18n.defaultLocale = "en_GB.UTF-8";

 services = {
   pipewire = {
     enable            = true;
     alsa.enable       = true;
     pulse.enable      = true;
     alsa.support32Bit = true;
   };

   automatic-timezoned.enable = true;
 };

 boot = {
   kernelParams = [ "quiet"]; 

   loader = {
     timeout = 5;

     systemd-boot = {
       configurationLimit = 5;
       enable             = true;
     };

     efi = { canTouchEfiVariables = true; };
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

 users = {
   users.${vars.user} = {
     isNormalUser   = true;
     hashedPassword = "${vars.password}";
     extraGroups    = [ "audio" "users" "video" "wheel" "networkmanager" ];
   };
 };
}
