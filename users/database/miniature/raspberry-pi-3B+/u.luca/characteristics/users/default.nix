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
   name           = "Vonix";
   home           = "/home/vonixos";
   extraGroups    = [ "audio" "video" "wheel" "networkmanager" ];
   hashedPassword = "$y$j9T$eDooCqRrtgj05orlhUujQ1$RDV9aOlJZkKZI6wtkpR.YD00ELzIlNZbDWY8IiDIxfB";
 };
}
