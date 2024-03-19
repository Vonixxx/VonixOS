###########
# VonixOS #
#########################
# Printer Configuration #
#########################
{ lib
, config
, ...
}:

with lib;

{
 config = mkIf (config.printing.enable) {
   hardware.sane = {
     enable          = true;
     openFirewall    = true;
     brscan4.enable  = true;
     brscan5.enable  = true;
     dsseries.enable = true;

     extraBackends = [
       epkowa
       hplipWithPlugin
       sane-airscan
       utsushi
     ];

     disabledDefaultBackends = [ "escl" ];
   };

   services = {
     ipp-usb.enable = true;

     avahi = {
       enable  = true;
       nssmdns = true;
     };

     printing = {
       enable          = true;
       browsing        = true;
       openFirewall    = true;
       defaultShared   = true;
       startWhenNeeded = false;

       drivers = [
         brlaser
         brgenml1lpr
         brgenml1cupswrapper
         gutenprint
         gutenprintBin
         hplip
         postscript-lexmark
       ];
     };
   };
 };
}
