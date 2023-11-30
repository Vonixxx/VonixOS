###########
# VonixOS #
######################
# Foot Configuration #
######################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.foot = {
     enable        = true;
     server.enable = true;
     settings = {
       cursor = {
         blink = true;
         style = "block";
       };
       scrollback = {
         multiplier = 3;
         lines      = 300;
       };
       csd = {
         font = "CascadiaCode";
       };
       main = {
         font = "monospace:size=12";
       };
       colors = {
         alpha      = 1.0;
         bright0    = "${vars.foot.bright0}"; 
         bright1    = "${vars.foot.bright1}"; 
         bright2    = "${vars.foot.bright2}"; 
         bright3    = "${vars.foot.bright3}"; 
         bright4    = "${vars.foot.bright4}"; 
         bright5    = "${vars.foot.bright5}"; 
         bright6    = "${vars.foot.bright6}"; 
         bright7    = "${vars.foot.bright7}";  
         regular0   = "${vars.foot.regular0}"; 
         regular1   = "${vars.foot.regular1}"; 
         regular2   = "${vars.foot.regular2}"; 
         regular3   = "${vars.foot.regular3}"; 
         regular4   = "${vars.foot.regular4}"; 
         regular5   = "${vars.foot.regular5}"; 
         regular6   = "${vars.foot.regular6}"; 
         regular7   = "${vars.foot.regular7}"; 
         foreground = "${vars.foot.foreground}";
         background = "${vars.foot.background}";
       };
     };
   };
 };
}
