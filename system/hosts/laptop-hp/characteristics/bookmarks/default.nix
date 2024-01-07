###########
# VonixOS #
#####################################
# System-Specific FireFox Bookmarks #
#####################################
{ vars, arkenfox, ... }:

{
 home-manager.users.${vars.user} = {
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
