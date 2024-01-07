###########
# VonixOS #
###########################
# System-Specific Imports #
###########################
{ ... }:

{
 imports = ( 
   import ./characteristics               ++
   import ../../../modules/programs       ++
   import ../../../modules/programs-optional 
 );
}
