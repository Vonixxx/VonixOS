###########
# VonixOS #
#######################
# NixOS Configuration #
#######################
{ lib, pkgs, vars, config, inputs, nixneovim, home-manager, ... }:

{
 imports = ( 
   import ../modules/desktops ++
   import ../modules/programs ++
   import ../modules/terminal
 );

 system.stateVersion = "23.11"; 
 home-manager.users.${vars.user} = {
   programs.home-manager.enable = true;
   home.stateVersion            = "23.11";
   imports = [ nixneovim.nixosModules.default ];
 };

 environment.systemPackages = with pkgs; [
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
   pulsemixer
   python3Full
   usbutils
   virt-manager
   wget
   ################
   # Applications #
   ################
   freetube
   libreoffice-fresh
   mkpasswd
   mediainfo
   nixos-generators
   pfetch
   teams-for-linux
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

 i18n.defaultLocale = "${vars.defaultlocale}";
 i18n.extraLocaleSettings = {
   LC_TIME           = "${vars.extralocale}";
   LC_NAME           = "${vars.extralocale}";
   LC_PAPER          = "${vars.extralocale}";
   LC_ADDRESS        = "${vars.extralocale}";
   LC_NUMERIC        = "${vars.extralocale}";
   LC_MONETARY       = "${vars.extralocale}";
   LC_TELEPHONE      = "${vars.extralocale}";
   LC_MEASUREMENT    = "${vars.extralocale}";
   LC_IDENTIFICATION = "${vars.extralocale}";
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
     extraGroups    = [ "networkmanager" "libvirtd" "wheel" "users" "video" "audio" ];
   };
 };
}
