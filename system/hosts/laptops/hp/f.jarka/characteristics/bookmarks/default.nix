###########
# VonixOS #
#####################################
# System-Specific FireFox Bookmarks #
#####################################
{ ... }:

{
 home-manager.users.vonix = {
   programs.firefox = {
     policies = {
       ManagedBookmarks = [
         {
          name = "Seznam"; 
          url  = "seznam.cz";
         }
         {
          name = "FIO Banka"; 
          url  = "ib.fio.cz/ib/login";
         }
         {
          name = "Seznam Email"; 
          url  = "email.seznam.cz";
         }
         {
          name = "Datove Schranky"; 
          url  = "mojedatovaschranka.cz/portal/ISDS/seznamzprav/prijate";
         }
       ];
     };
   };
 };
}
