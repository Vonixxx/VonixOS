###########
# VonixOS #
###########################
# System-Specific Imports #
###########################
{ ... }:

{
 imports = ( 
   import ./characteristics                       
   ++ import ../../../../modules/environments        
   ++ import ../../../../modules/programs/generic.nix
   ++ import ../../../../modules/programs/terminal.nix
   ++ import ../../../../modules/programs/window-manager.nix
 );
}
