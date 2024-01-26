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
         {
     	    name = "GitHub";
     	    url  = "https://github.com";
     	   }
         {
     	    name = "ChatGPT";
     	    url  = "https://chat.openai.com";
     	   }
         {
     	    name = "Roadmap";
     	    url  = "https://roadmap.sh/devops";
     	   }
         {
     	    name = "Tutanota";
     	    url  = "https://app.tuta.com/login";
     	   }
         {
     	    name = "Hoogle";
     	    url  = "https://hoogle.haskell.org/";
     	   }
         {
     	    name = "Coinbase";
     	    url  = "https://www.coinbase.com/home";
     	   }
         {
     	    name = "Nix User Repository";
     	    url  = "https://nur.nix-community.org";
     	   }
         {
     	    name = "NixOS Options";
     	    url  = "https://search.nixos.org/options?channel=23.11&";
     	   }
         {
     	    name = "NixOS Packages";
     	    url  = "https://search.nixos.org/packages?channel=23.11&";
     	   }
         {
     	    name = "Certificates";
     	    url  = "https://devopscube.com/best-devops-certifications";
     	   }
         {
     	    name = "Home-Manager";
     	    url  = "https://mipmip.github.io/home-manager-option-search";
     	   }
       ];
     };
   };
 };
}
