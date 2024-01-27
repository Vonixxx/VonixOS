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
     	    name = "Seznam";
     	    url  = "https://www.seznam.cz";
     	   }
         {
     	    name = "Seznam Email";
     	    url  = "https://email.seznam.cz";
     	   }
         {
     	    name = "FIO Banka";
     	    url  = "https://ib.fio.cz/ib/login";
     	   }
         {
     	    name = "Datove Schranky";
     	    url  = "https://www.mojedatovaschranka.cz/portal/ISDS/seznamzprav/prijate";
     	   }
       ];
     };
   };
 };
}
