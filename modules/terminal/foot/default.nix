###########
# VonixOS #
######################
# Foot Configuration #
######################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.foot = {
     enable = true;
     settings = {
       scrollback = {
         multiplier = 3;
         lines      = 300;
       };
       csd = {
         font = "CascadiaCode";
       };
       cursor = {
         blink = true;
         style = "block";
       };
       main = {
         font = "monospace:size=12";
       };
       colors = {
         alpha      = 1.0;
         foreground = "D9E0EE";
         background = "1E1D2F";
         bright0    = "988BA2"; 
         bright1    = "F28FAD"; 
         bright2    = "ABE9B3"; 
         bright3    = "FAE3B0"; 
         bright4    = "96CDFB"; 
         bright5    = "F5C2E7"; 
         bright6    = "89DCEB"; 
         bright7    = "D9E0EE";  
         regular0   = "6E6C7E"; 
         regular1   = "F28FAD"; 
         regular2   = "ABE9B3"; 
         regular3   = "FAE3B0"; 
         regular4   = "96CDFB"; 
         regular5   = "F5C2E7"; 
         regular6   = "89DCEB"; 
         regular7   = "D9E0EE"; 
       };
     };
   };
 };
}
