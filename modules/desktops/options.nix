###########
# VonixOS #
###################################
# WM/DE-Specific Enabled Packages #
###################################
{ lib, ... }:

with lib;
{
 options = {
   laptop = {
     enable = mkOption {
       default = false;
       type    = types.bool;
     };
   };
   desktop = {
     enable = mkOption {
       default = false;
       type    = types.bool;
     };
   };
 };
}
