###########
# VonixOS #
######################
# User Configuration #
######################
{ vars, unknown-vars, ... }:

{
 users.users.${vars.user} = {
   uid          = 1000;
   isNormalUser = true;
   home         = "/home/vonix";
   password     = "${unknown-vars.password}";
   extraGroups  = [ "audio" "video" "wheel" "libvirtd" "networkmanager" ];
 };
}