###########
# VonixOS #
###################################
# WM/DE-Specific Enabled Packages #
###################################
{ lib, ... }:

with lib;
{
 options = {
   desktop = {
     enable = mkOption {
       default = false;
       type    = types.bool;
     };
   };
   laptop = {
     enable = mkOption {
       default = false;
       type    = types.bool;
     };
   };
 };
}
