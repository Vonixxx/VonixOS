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
     profiles.default.settings."extensions.activeThemeID" = "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}"; 

     policies.ExtensionSettings."{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}" = {
       installation_mode = "normal_installed";          
       install_url       = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-mauve/latest.xpi";
     };
   };
 };
}
