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
     withWlroots = true;
     serviceMode = "user";
     userName    = "Vonix";

     yamlConfig = ''
        keymap:
         -name: main;
           remap:
            super-u:
             launch: ["firefox"]

     '';
   };
 };
}
