###########
# VonixOS #
########################
# Gnome Configuration #
########################
{ lib, pkgs, vars, config, ... }:

with lib;
{
 options = {
   gnome = {
     enable = mkOption {
       default = false;
       type    = types.bool;
     };
   };
 };

 config = mkIf (config.gnome.enable) {
   hardware = { 
     pulseaudio.enable = false;
     openrazer = {
       enable = true;
       users  = [ "vonix" ];
     };
   };

   home-manager.users.${vars.user} = {
     dconf.settings = {
       "org/gnome/desktop/privacy" = { 
         remove-old-temp-files  = true;
         remove-old-trash-files = true; 
       };
       "org/gnome/desktop/interface" = { 
         enable-hot-corners = false;
         color-scheme       = "prefer-dark"; 
       };
       "org/gnome/mutter" = { 
         edge-tiling                = true;
         workspaces-only-on-primary = true;
         dynamic-workspaces         = false;
       };
       "org/gnome/desktop/session"               = { idle-delay = false; };
       "org/gnome/desktop/wm/preferences"        = { num-workspaces = 4; };
       "org/gnome/desktop/screensaver"           = { lock-enabled = false; };
       "org/gnome/desktop/notifications"         = { show-in-lock-screen = false; };
       "org/gnome/shell/app-switcher"            = { current-workspace-only = false; };
       "org/gnome/settings-daemon/plugins/power" = { power-button-action = "interactive"; };
     };
   };

   environment = { 
     systemPackages = (with pkgs; [
       gnome.gnome-tweaks
       pcsx2
       polychromatic
       rpcs3
       steam
       steamtinkerlaunch
     ]) ++ (with pkgs.gnomeExtensions; [
        arcmenu
	burn-my-windows
        dash-to-panel
	gnome-40-ui-improvements
	space-bar
	transparent-window-moving
     ]);

     gnome.excludePackages = (with pkgs; [
       gnome-tour
       gnome-photos
       gnome-connections
       gnome-text-editor
     ]) ++ (with pkgs.gnome; [
        atomix
        cheese
        epiphany
        geary
        gedit 
        gnome-maps
        gnome-music
	gnome-contacts
        gnome-terminal
        gnome-characters
	gnome-shell-extensions
        hitori
        iagno
	libgnome-keyring
	seahorse
	simple-scan
        tali
	yelp
     ]); 
   };

   services = {
     xserver = {
       enable                      = true;
       libinput.enable             = true;
       desktopManager.gnome.enable = true;
       displayManager.gdm.enable   = true;
       layout                      = "us";
       excludePackages             = [ pkgs.xterm ];
     };
   };
 };
}
