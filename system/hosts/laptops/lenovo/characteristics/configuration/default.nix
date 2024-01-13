###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ vars, unknown-vars, ... }:

{
 sway.enable                    = true;
 virtualisation.libvirtd.enable = true;

 services = {
   udev.enable         = true;
   getty.autologinUser = "vonix";
 };

 home-manager.users.${vars.user}.programs.git = {
   userName  = "Vonixxx";
   userEmail = "vonixxxwork@tuta.io";
 };

 networking.wireless = {
   enable   = true; 
   networks = {
     Vonix.psk                = "${unknown-vars.wifi.vonix}"; 
     Pixel.psk                = "${unknown-vars.wifi.pixel}"; 
     O2-Internet-704.psk      = "${unknown-vars.wifi.libor}"; 
     O2-Internet-704-5GHz.psk = "${unknown-vars.wifi.libor}"; 
   };
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
