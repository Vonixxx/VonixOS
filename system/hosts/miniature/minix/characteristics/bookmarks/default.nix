###########
# VonixOS #
#####################################
# System-Specific FireFox Bookmarks #
#####################################
{ ... }:

{
 home-manager.users.vonix = {
   programs.firefox = {
     profiles.default = {
       bookmarks = [
       ];
     };
   };
 };
}
