###########
# VonixOS #
#######################
# NixOS Configuration #
#######################
{ lib, pkgs, vars, config, inputs, ... }:

{
 imports = ( 
   import ../modules/shell ++ 
   import ../modules/desktops  
 );

 nixpkgs.config.allowUnfree = true;
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

 services.pipewire = {
   enable            = true;
   alsa.enable       = true;
   pulse.enable      = true;
   alsa.support32Bit = true;
 };

 boot.kernelParams = [ "quiet"]; 

 services.automatic-timezoned = {
   enable = true;
 };

 environment = {
   variables = {
     EDITOR   = "${vars.editor}";
     VISUAL   = "${vars.editor}";
     TERMINAL = "${vars.terminal}";
   };
 };

 i18n.defaultLocale = ${vars.defaultlocale};
 i18n.extraLocaleSettings = {
   LC_TIME           = ${vars.extralocale};
   LC_NAME           = ${vars.extralocale};
   LC_PAPER          = ${vars.extralocale};
   LC_ADDRESS        = ${vars.extralocale};
   LC_NUMERIC        = ${vars.extralocale};
   LC_MONETARY       = ${vars.extralocale};
   LC_TELEPHONE      = ${vars.extralocale};
   LC_MEASUREMENT    = ${vars.extralocale};
   LC_IDENTIFICATION = ${vars.extralocale};
 };

 networking = {
   firewall.enable       = true;
   networkmanager.enable = true;
 };

 security = {
   rtkit.enable            = true;
   polkit.enable           = true;
   sudo.wheelNeedsPassword = false;
 };

 programs.dconf.enable          = true;
 virtualisation.libvirtd.enable = true;

 hardware.opengl.enable          = true;
 hardware.opengl.driSupport      = true;
 hardware.opengl.driSupport32Bit = true;
 
 nix = {
   settings.auto-optimise-store = true;
   settings = {
     auto-optimise-store = true;
     experimental-features = [ "nix-command" "flakes" ];
   };
   gc = {
     automatic = true;
     dates     = "weekly";
     options   = "--delete-older-than 3d";
   };
 }; 

 programs.zsh.enable    = true;
 users.defaultUserShell = with pkgs; { zsh };
 environment.shells     = with pkgs; [ zsh ];

 services.udev = {
   enable = true;
   packages = with pkgs; [ android-udev-rules ];
 };

 fonts.packages = with pkgs; [
   line-awesome
   liberation_ttf
   noto-fonts-cjk
   noto-fonts-emoji
   (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
 ];
 
 environment.etc."Stars.jpg".source = /home/${vars.user}/VonixOS/Stars.jpg;

 users.users.${vars.user} = {
   isNormalUser   = true;
   extraGroups    = [ "networkmanager" "libvirtd" "wheel" "users" "video" "audio" ];
   hashedPassword = "$6$2apmrKDHbo.NXO.l$R8rgwCFVrbnU5rJDgtb2qMFcbPFqCAdDkm2Mn8sVU.gw9YMGu9oBXZTLdyiybKaiOXaKxdPDeGhQpzccwn93D1";
 };

 system.stateVersion = "23.11"; 

 home-manager.users.${vars.user} = {
   home = {
     stateVersion = "23.11";
   };
   programs = {
     home-manager.enable = true;
   };
 };
}
