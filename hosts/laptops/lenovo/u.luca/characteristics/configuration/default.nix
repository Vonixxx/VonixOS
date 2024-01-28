###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ ... }:

{
 generic.enable        = true;
 terminal.enable       = true;
 hyprland.enable       = true;
 window-manager.enable = true;
 programs.light.enable = true;

 services = {
   udev.enable         = true;
   getty.autologinUser = "Vonix";
 };

 home-manager.users.vonix.programs.git = {
   userName  = "Vonixxx";
   userEmail = "vonixxxwork@tuta.io";
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
}
