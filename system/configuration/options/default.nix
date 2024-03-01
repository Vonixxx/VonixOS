{ lib
, ...
}:

with lib;
with types;

{
 options = {
   bat.enable = mkOption {
     type    = bool;
     default = false;
   };

   git.enable = mkOption {
     type    = bool;
     default = false;
   };

   lsd.enable = mkOption {
     type    = bool;
     default = false;
   };

   mpv.enable = mkOption {
     type    = bool;
     default = false;
   };

   zsh.enable = mkOption {
     type    = bool;
     default = false;
   };

   foot.enable = mkOption {
     type    = bool;
     default = false;
   };

   mako.enable = mkOption {
     type    = bool;
     default = false;
   };

   wofi.enable = mkOption {
     type    = bool;
     default = false;
   };

   gnome.enable = mkOption {
     type    = bool;
     default = false;
   };

   helix.enable = mkOption {
     type    = bool;
     default = false;
   };

   waybar.enable = mkOption {
     type    = bool;
     default = false;
   };

   sioyek.enable = mkOption {
     type    = bool;
     default = false;
   };

   amdcpu.enable = mkOption {
     type    = bool;
     default = false;
   };

   amdgpu.enable = mkOption {
     type    = bool;
     default = false;
   };

   firefox.enable = mkOption {
     type    = bool;
     default = true;
   };

   wpaperd.enable = mkOption {
     type    = bool;
     default = false;
   };

   hyprland.enable = mkOption {
     type    = bool;
     default = false;
   };

   intelcpu.enable = mkOption {
     type    = bool;
     default = false;
   };

   intelgpu.enable = mkOption {
     type    = bool;
     default = false;
   };

   gammastep.enable = mkOption {
     type    = bool;
     default = false;
   };

   kdenlive-obs.enable = mkOption {
     type    = bool;
     default = false;
   };

   general-configuration.enable = mkOption {
     type    = bool;
     default = true;
   };
 };
}
