###########
# VonixOS #
######################
# User Configuration #
######################
{ vars, ... }:

{
 users.users.${vars.user} = {
   uid            = 1000;
   isNormalUser   = true;
   home           = "/home/bubinka";
   extraGroups    = [ "audio" "video" "wheel" "networkmanager" ];
   hashedPassword = "$y$j9T$YQnrV6FSbngHwY4Y/xCR7/$b5I3pMtjPHb8YQdjXwuEZLFna9Nj2h7eT6uRP4P7n.4";
 };
}
