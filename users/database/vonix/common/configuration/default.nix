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

 xdg.portal = {
   xdgOpenUsePortal = false;

   extraPortals = [
     xdg-desktop-portal-gtk
     xdg-desktop-portal-hyprland
   ];
 };

 services = {
   gvfs.enable         = true;
   getty.autologinUser = "Vonix";
 };

 environment = {
   loginShellInit = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
   '';

   variables = {
     NIXOS_OZONE_WL = "1";
     BROWSER        = "firefox";
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

   home.pointerCursor = {
     gtk.enable = true;
     x11.enable = true;
     package    = catppuccin-cursors.mochaMauve;
     name       = "Catppuccin-Mocha-Mauve-Cursors";
   };

   programs.firefox = {
     profiles.default.settings = {
       "browser.urlbar.suggest.bookmark" = true;
       "browser.urlbar.suggest.history"  = false;
       "browser.urlbar.suggest.openpage" = false;
       "browser.urlbar.suggest.topsites" = false;
       "extensions.activeThemeID"        = "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}";
     };

     policies = {
       DisplayBookmarksToolbar = "never";

       ExtensionSettings."{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}" = {
         installation_mode = "force_installed";
         install_url       = "https://addons.mozilla.org/firefox/downloads/file/3990325/catppuccin_mocha_mauve_git-2.0.xpi";
       };
     };
   };
 };
}
