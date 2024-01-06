###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ unknown-vars, ... }:

{
 imports = ( 
   import ./characteristics         ++
   import ../../../modules/programs ++
   import ../../../modules/terminal ++
   import ../../../modules/programs-wm
 );

 hyprland.enable = true;

 services = {
   udev.enable         = true;
   getty.autologinUser = "vonix";
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
