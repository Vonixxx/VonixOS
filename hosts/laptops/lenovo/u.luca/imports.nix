###########
# VonixOS #
###########################
# System-Specific Imports #
###########################
{ ... }:

{
 imports = ( 
   import ./characteristics                       
   ++ import ../../../../system
   ++ import ../../../../modules        
 );
}
