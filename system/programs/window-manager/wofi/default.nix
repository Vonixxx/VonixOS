###########
# VonixOS #
######################
# Wofi Configuration #
######################
{ lib, config, ... }: with lib;

{
 config = mkIf (config.window-manager.enable) {
   home-manager.users.vonix.programs = {
     wofi = {
       enable = true;
  
       settings = {
         lines        = 5;
         width        = 250;
         allow_markup = true;
         hide_scroll  = true;
         show         = "run";
         prompt       = "Launch:";
       };
  
       style = '' 
          @define-color base              #181825;
          @define-color text              #CDD6F4;
          @define-color border            #CBA6F7;
          @define-color baseAlt           #1E1E2E;
          @define-color selectedHighlight #9399B2;
  
          #window {
           border-radius:    10px;
           background-color: @base;
          }
          
          #outer-box {
           border-radius:    10px;
           background-color: @base;
           border: 4px solid @border;
          }
          
          #entry:selected {
           color:            @text;
           background-color: @baseAlt;
          } 
  
          #input{
           margin:           1rem;
           border-radius:    10px;
           padding:          0.5rem;
           background-color: @baseAlt;
          }
          
          * {
           font-size:   15px;
           all:         unset;
           font-family: "CascadiaCode";
          }
          
          #entry {
           border-radius: 8px;
           color:         @selectedHighlight;
           margin:        0.25rem 0.75rem 0.25rem 0.75rem;
           padding:       0.25rem 0.75rem 0.25rem 0.75rem;
          }
       '';
     };
   };
 };
}
