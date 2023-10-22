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
     profiles = {
       bookmarks = [
         {
	  toolbar = true;
	  name    = "Linux";
	  bookmarks = [
	    {
	     name = "NixOS";
	     url  = "https://search.nixos.org/packages";
	    }
	  ];
	 }
       ];
     };
   };
 };
}
