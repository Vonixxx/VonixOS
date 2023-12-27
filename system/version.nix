{ config, ... }:

{
 system.stateVersion = "23.11"; 

 home-manager.users.${vars.user} = {
   programs.home-manager.enable = true;
   home.stateVersion            = "23.11";
   imports                      = [ arkenfox.hmModules.arkenfox ];
 };
}
