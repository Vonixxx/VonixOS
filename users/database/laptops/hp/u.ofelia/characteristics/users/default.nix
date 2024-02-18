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
   name           = "Ofelia";
   home           = "/home/vonixos";
   extraGroups    = [ "audio" "video" "wheel" "networkmanager" ];
   hashedPassword = "$y$j9T$Bt3YhGYQoALhjeZY7MauX/$jlIcH1JuGjKz2UqTj7CEtwIbNNr8hRpqgRU7CEi0CBA";
 };
}
