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

     config.keymap = [
       {
        name = "Main"; 
        remap = {
          super-u = { launch = ["firefox"]; };  
        };
       } 
     ];      
   };
 };
}
