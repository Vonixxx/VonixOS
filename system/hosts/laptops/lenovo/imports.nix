###########
# VonixOS #
###########################
# System-Specific Imports #
###########################
{ ... }:

{
 imports = ( 
   import ./characteristics                       
   ++ import ../../../../modules/terminal            
   ++ import ../../../../modules/environments        
   ++ import ../../../../modules/programs/generic.nix
   ++ import ../../../../modules/programs/window-manager.nix
 );
}
