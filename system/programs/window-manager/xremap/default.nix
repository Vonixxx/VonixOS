###########
# VonixOS #
######################
# Mako Configuration #
######################
{ lib
, config
, xremap
, ...
}: 

with lib;

let 
 youtube    = "/run/current-system/sw/bin/freetube";
 launcher   = "/home/vonixos/.nix-profile/bin/wofi";
 terminal   = "/home/vonixos/.nix-profile/bin/foot";
 screenshot = "/run/current-system/sw/bin/grimblast";
 pdf        = "/home/vonixos/.nix-profile/bin/sioyek";
 browser    = "/home/vonixos/.nix-profile/bin/firefox";
in 
{
 imports = [ xremap.nixosModules.default ];

 config = mkIf (config.window-manager.enable) {
   services.xremap = {
     withWlroots = true;
     userName    = "Vonix";
     serviceMode = mkForce "user";

     config.keymap = [
       {
        remap = {
          super-p.launch     = [ "${pdf}" ]; 
          super-b.launch     = [ "${browser}" ]; 
          super-y.launch     = [ "${youtube}" ]; 
          super-t.launch     = [ "${terminal}" ]; 
          super-d.launch     = [ "${launcher}" ]; 
          super-print.launch = [ "${screenshot}" ]; 
        };
       }
     ];
   };
 };
}
