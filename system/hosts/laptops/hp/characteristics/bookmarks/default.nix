###########
# VonixOS #
#####################################
# System-Specific FireFox Bookmarks #
#####################################
{ arkenfox, ... }:

{
 home-manager.users.vonix = {
   programs.firefox = {
     profiles.default = {
       bookmarks = [
         {
     	    name = "ChatGPT";
     	    url  = "https://chat.openai.com";
     	   }
         {
     	    name = "Tutanota";
     	    url  = "https://app.tuta.com/login";
     	   }
       ];
     };
   };
 };
}
