###########
# VonixOS #
######################
# Wofi Configuration #
######################
{ ... }:

{
 home-manager.users.vonix.programs = {
   wofi = {
     enable = true;

     settings = {
       show = "run";
       width = 250;
       prompt = "Launch:";
       allow_markup = true;
       hide_scroll = true;
       lines = 5;
     };

     style = '' 
        @define-color base            #181825;
        @define-color baseAlt         #1E1E2E;
        @define-color border          #CBA6F7;
        @define-color highlightResult #F5E0DC;
        @define-color highlightSearch #F2CDCD;
         
        #entry {
         padding: 10px;
        }

        #entry:nth-child(even) {
         background-color: @base;
        }
         
        #outer-box {
         margin:            5px;
         padding:           10px;
         border-radius:     15px;
         background-color:  @base;
        }
         
        #text {
         padding: 5px;
         color:   @highlightSearch;
        }
         
        * {
         font-size:   15px;
         font-family: "CascadiaCode";
        }
         
        #input {
         padding:       3px;
         border-radius: 5px;
         border:        none;
         margin-bottom: 15px;
         color:         @highlightSearch;
        }
         
        window {
         border-radius: 10px;
         border:        3px solid @border;
        }
         
        #entry:selected {
         background-color: @highlightResult;
        }

        #inner-box {
         background-color: @baseAlt;
         box-shadow:       -4px -3px 45px 20px rgba(0,0,0,0.35);
        }
     '';
   };
 };
}
