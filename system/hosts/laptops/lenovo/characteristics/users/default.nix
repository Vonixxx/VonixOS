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
   home           = "/home/vonix";
   extraGroups    = [ "audio" "video" "wheel" "libvirtd" "networkmanager" ];
   hashedPassword = "$y$j9T$eDooCqRrtgj05orlhUujQ1$RDV9aOlJZkKZI6wtkpR.YD00ELzIlNZbDWY8IiDIxfB";
 };
}
