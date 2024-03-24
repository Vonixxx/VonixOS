###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ pkgs
, ...
}:

with pkgs;
with gnome;

{
 bat.enable                   = true;
 git.enable                   = true;
 lsd.enable                   = true;
 zsh.enable                   = true;
 foot.enable                  = true;
 mako.enable                  = true;
 wofi.enable                  = true;
 atuin.enable                 = true;
 helix.enable                 = true;
 amdcpu.enable                = true;
 amdgpu.enable                = true;
 waybar.enable                = true;
 wpaperd.enable               = true;
 hyprland.enable              = true;
 gammastep.enable             = true;
 joshuto.enable               = false;
 services.getty.autologinUser = "Vonix";

 xdg.portal.extraPortals = [
   xdg-desktop-portal-gtk
   xdg-desktop-portal-hyprland
 ];

 environment = {
   loginShellInit = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
   '';

   variables = {
     NIXOS_OZONE_WL = "1";
     PF_INFO        = "ascii title uptime pkgs kernel memory os host";
   };
 };

 home-manager.users.vonix = {
   gtk = {
     enable = true;

     iconTheme = {
       name    = "Adwaita";
       package = adwaita-icon-theme;
     };
   };

   programs.git = {
     userName  = "Vonixxx";
     userEmail = "vonixxxwork@tuta.io";
   };

   programs.firefox = {
     profiles.default.settings."extensions.activeThemeID" = "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}";

     policies.ExtensionSettings."{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}" = {
       installation_mode = "force_installed";
       install_url       = "https://addons.mozilla.org/firefox/downloads/file/3990325/catppuccin_mocha_mauve_git-2.0.xpi";
     };
   };
 };
}
