###########
# VonixOS #
######################
# User Configuration #
######################
{ ... }:

{
 users.users.vonix = {
   uid            = 1000;
   isNormalUser   = true;
   name           = "Jarka";
   home           = "/home/vonixos";
   extraGroups    = [ "audio" "video" "wheel" "networkmanager" ];
   hashedPassword = "$y$j9T$uvFyKPrjFI6ShTbD3RYii/$VaM6sSvsjn.QzTkY8ZnRFLQaZB9ijUorNVGwWesIbV0";
 };
}
