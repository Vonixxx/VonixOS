###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ ... }:

{
 sway.enable = true;

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
        exec sway
      fi
   '';

   variables = {
     VISUAL   = "hx";
     EDITOR   = "hx";
     TERMINAL = "kitty";
     BROWSER  = "firefox";
     PF_INFO  = "ascii title uptime pkgs kernel memory os host";
   };
 };
}
