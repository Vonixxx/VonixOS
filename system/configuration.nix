###########
# VonixOS #
#######################
# NixOS Configuration #
#######################
{ lib, nur, pkgs, vars, config, inputs, nixneovim, home-manager, ... }:

{
 imports = ( 
   import ../modules/desktops ++
   import ../modules/programs ++
   import ../modules/terminal
 );

 system.stateVersion = "23.11"; 

 home-manager.users.${vars.user} = {
   imports = [ 
     nixneovim.nixosModules.default 
   ];
   programs.home-manager.enable = true;
   home.stateVersion            = "23.11";
 };

 environment.systemPackages = with pkgs; [
   nur.repos.mic92.hello-nur
   ##################
   # Terminal/Tools #
   ##################
   coreutils
   efibootmgr
   ghc
   haskell-language-server
   killall
   parted
   pciutils
   pfetch-rs
   pulsemixer
   python3Full
   usbutils
   virt-manager
   wev
   wget
   ################
   # Applications #
   ################
   freetube
   libreoffice-fresh
   mkpasswd
   mediainfo
   nixos-generators
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
   unzip
   unrar
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
   firewall.enable       = true;
   networkmanager.enable = true;
 };

 environment = {
   shells = with pkgs; [ zsh ];
   variables = {
     EDITOR   = "${vars.editor}";
     VISUAL   = "${vars.editor}";
     TERMINAL = "${vars.terminal}";
   };
 };

 security = {
   rtkit.enable            = true;
   polkit.enable           = true;
   sudo.wheelNeedsPassword = false;
 };

 virtualisation.libvirtd.enable = true;

 i18n = {
  defaultLocale = "${vars.defaultLocale}";
  extraLocaleSettings = {
     LC_TIME           = "${vars.extraLocale}";
     LC_NAME           = "${vars.extraLocale}";
     LC_PAPER          = "${vars.extraLocale}";
     LC_ADDRESS        = "${vars.extraLocale}";
     LC_NUMERIC        = "${vars.extraLocale}";
     LC_MONETARY       = "${vars.extraLocale}";
     LC_TELEPHONE      = "${vars.extraLocale}";
     LC_MEASUREMENT    = "${vars.extraLocale}";
     LC_IDENTIFICATION = "${vars.extraLocale}";
   };
 };

 services = {
   transmission = {
     enable = true;
   };
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

 nix = {
   gc = {
     automatic = true;
     dates     = "weekly";
     options   = "--delete-older-than 3d";
   };
   settings = {
     auto-optimise-store   = true;
     substituters          = [ "https://cache.iog.io" ];
     experimental-features = [ "nix-command" "flakes" ];
     trusted-public-keys   = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
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
