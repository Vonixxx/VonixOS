###########
# VonixOS #
######################
# User Configuration #
######################
{ ... }:

{
 home-manager.users.vonix.accounts = {
   email.accounts.default = {
     primary            = true;
     thunderbird.enable = true;
     address            = "vonixxx@tuta.io";
   };
 };

 users.users.vonix = {
   uid            = 1000;
   isNormalUser   = true;
   name           = "Vonix";
   home           = "/home/vonix";
   extraGroups    = [ "audio" "video" "wheel" "networkmanager" ];
   hashedPassword = "$y$j9T$eDooCqRrtgj05orlhUujQ1$RDV9aOlJZkKZI6wtkpR.YD00ELzIlNZbDWY8IiDIxfB";
 };
}
