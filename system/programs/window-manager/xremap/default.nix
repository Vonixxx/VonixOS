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

{
 imports = [ xremap.nixosModules.default ];

 config = mkIf (config.window-manager.enable) {
   services.xremap = {
     withHypr    = true;
     userName    = "Vonix";
     serviceMode = mkForce "user";

     config.keymap = [
       {
        remap = {
          alt-u.launch = ["firefox"]; 
        };
       }
     ];
   };
 };
}
