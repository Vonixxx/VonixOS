###########
# VonixOS #
#######################################
# NixOS System-Specific Configuration #
#######################################
{ ... }:

{
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

 nix.settings = {
   substituters        = [ "https://cache.iog.io" ];
   trusted-public-keys = [ "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" ];
 };

 home-manager.users.vonix = {
   programs.git = {
     userName  = "Vonixxx";
     userEmail = "vonixxxwork@tuta.io";
   };

   programs.firefox.profiles.default.settings."extensions.activeThemeID" = "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}"; 
 };
}
