#############
# VanillaOS #
#######################
# NixOS Configuration #
#######################
{ vars, unknown-vars, ... }:

{
 imports = ( 
   import ./characteristics      ++
   import ../../../modules/programs 
 );

 hardware.opengl = {
   enable          = true;
   driSupport      = true;
   driSupport32Bit = true;
 };

 programs.dconf.enable = true;

 networking = {
   firewall.enable       = true;
   networkmanager.enable = true;
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

 users = {
   users.${vars.user} = {
     isNormalUser = true;
     password     = "${unknown-vars.password}";
     extraGroups  = [ "audio" "users" "video" "wheel" ];
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

 programs.bash.shellAliases.update = "sudo nix flake update 'github:Vonixxx/VonixOS' && sudo nixos-rebuild switch --no-write-lock-file --flake 'github:Vonixxx/VonixOS#vanillaos-gnome'";
}
