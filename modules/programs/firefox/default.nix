###########
# VonixOS #
#########################
# FireFox Configuration #
#########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.firefox = {
     enable = true;
     profiles.default = {
       id             = 0;
       isDefault      = true;
       name           = "default";
       search.default = "DuckDuckGo";
       # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
       #   bitwarden
       # ];
       bookmarks = [
         {
	  toolbar = true;
	  name    = "Linux";
	  bookmarks = [
     	    {
	     name = "NixOS";
	     url  = "https://search.nixos.org/packages/";
	    }
     	    {
	     name = "Home-Manager";
	     url  = "https://mipmip.github.io/home-manager-option-search/";
	    }
	  ];
	 }
       ];
     };
   };
 };
}
