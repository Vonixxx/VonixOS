###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ ... }:

{
 amdcpu.enable                = true;
 amdgpu.enable                = true;
 terminal.enable              = true;
 hyprland.enable              = true;
 window-manager.enable        = true;
 general-configuration.enable = true;

 services = {
   udev.enable         = true;
   getty.autologinUser = "Vonix";
 };

 environment = {
   loginShellInit = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
   '';

   variables = {
     VISUAL   = "hx";
     EDITOR   = "hx";
     TERMINAL = "foot";
     BROWSER  = "firefox";
     PF_INFO  = "ascii title uptime pkgs kernel memory os host";
   };
 };

 home-manager.users.vonix = {
   programs.git = {
     userName  = "Vonixxx";
     userEmail = "vonixxxwork@tuta.io";
   };

   programs.firefox = {
     profiles.default.settings."extensions.activeThemeID" = "{344d6267-2816-44d1-8aee-522d0ba07e04}"; 

     policies.ExtensionSettings."{344d6267-2816-44d1-8aee-522d0ba07e04}" = {
       installation_mode = "force_installed";          
       install_url       = "https://addons.mozilla.org/firefox/downloads/file/4228315/catppuccin_mocha_by_hackadia-1.0.xpi";
     };
   };
 };
}
