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
       lines        = 5;
       width        = 250;
       allow_markup = true;
       hide_scroll  = true;
       show         = "run";
       prompt       = "Launch:";
     };

     style = '' 
        @define-color base            #181825;
        @define-color baseAlt         #1E1E2E;
        @define-color text            #CDD6F4;
        @define-color border          #CBA6F7;
        @define-color surface         #313244;
        @define-color highlightResult #9399B2;
         
        #entry {
         padding: 10px;
        }

        #text {
         padding: 5px;
         color:   @text;
        }
         
        #entry:nth-child(even) {
         background-color: @base;
        }
         
        #outer-box {
         margin:            0px;
         padding:           10px;
         border-radius:     10px;
         background-color:  @base;
        }
         
        * {
         font-size:   15px;
         font-family: "CascadiaCode";
        }
         
        #input {
         padding:          5px;
         border-radius:    5px;
         margin-bottom:    15px;
         color:            @surface;
         background-color: @surface;
         border:           3px solid @border;
        }
         
        #window {
         border-radius: 10px;
         border:        3px solid @border;
        }
         
        #entry:selected {
         background-color: @highlightResult;
        }

        #inner-box {
         border-radius:    10px;
         background-color: @baseAlt;
        }
     '';
   };
 };
}
