###########
# VonixOS #
#########################
# FireFox Configuration #
#########################
{ arkenfox, ... }:

{
 home-manager.users.vonix = {
   imports = [ arkenfox.hmModules.arkenfox ];

   programs.firefox = {
     enable = true;

     policies = {
       ExtensionSettings = {
         "addon@darkreader.org" = {
           installation_mode = "normal_installed";          
           install_url       = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
         };
         "uBlock0@raymondhill.net" = {
           installation_mode = "force_installed";          
           install_url       = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
         };
         "{aec77dcc-cbdb-4dac-9a4f-8c6192040aab}" = {
           installation_mode = "normal_installed";          
           install_url       = "https://addons.mozilla.org/firefox/downloads/latest/adwaita-gnome-dark/latest.xpi";
         };
         "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}" = {
           installation_mode = "normal_installed";          
           install_url       = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-mauve/latest.xpi";
         };
         "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
           installation_mode = "normal_installed";          
           install_url       = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
         };
       };      
     };

     arkenfox = {
       enable = true;
       version = "119.0";
     };

     profiles.default = {
       id = 0;
   
       search = { 
         force   = true;
         default = "DuckDuckGo";
       };

       userChrome = ''       
          /* Search Bar */
          :root {
           --urlbar-open-width:      250px;
           --urlbar-collapsed-width: 500px;
          }
          
          #navigator-toolbox {
           flex-direction: row;
           display:        flex;
           flex-wrap:      wrap;
           position:       relative !important;
           padding-left:   var(--tab-block-margin);
          }
          
          
          /* Hide Flexible Spaces */
          toolbarspring,
          [id^="wrapper-customizableui-special-spring"] {
           display: none !important;
          }
          
          
          /* Tabs */
          #titlebar {
           width:     0;
           flex-grow: 1;
           overflow:  hidden;
          }

          .toolbar-items {
           flex-grow: 1 !important;
          }

          #toolbar-menubar[inactive="true"] {
           display: none !important;
          }

          @media (-moz-bool-pref: "onebar.hide-all-tabs-button") {
           @media not (max-width: 700px) {
            #alltabs-button {
             display: none !important;
            }
           }
          }
          
          #tabbrowser-tabs {
           flex:     1 !important;
           width:    0 !important;
           overflow: hidden !important;
          }

          #TabsToolbar {
           align-items: center;
           display:     flex !important;
          }

          #TabsToolbar-customization-target {
           align-items:  center;
           display:      flex !important;
           margin-block: auto !important;
          }

          .tab-background {
           margin-block: calc(2px + var(--tab-block-margin)) !important;
           box-shadow: none !important;
           transition: background-color .2s;
          }
          
          .tabbrowser-tab {
           min-height: calc(var(--tab-min-height) - 2px) !important;
          }

          
          /* Navigation Buttons */
          @media (-moz-bool-pref: "onebar.conditional-navigation-buttons") {
           :root:not([customizing]) #back-button[disabled],
           :root:not([customizing]) #forward-button[disabled] {
            display: none !important;
           }
          }

          :root[customizing] .urlbar-input-box::before {
           content: "https://";
           margin-block: auto;
          }

          :root[customizing] #urlbar-input {
           display: none !important;
          }
          
          :root[customizing] .urlbar-input-box {
           visibility: visible !important;
          }

          @media (-moz-bool-pref: "onebar.hide-navigation-buttons") {
           :is(#wrapper-back-button, #wrapper-forward-button) {
            opacity: 1 !important;
           }

           #wrapper-urlbar-container ~ :is(#wrapper-back-button, #wrapper-forward-button) {
            opacity: .5 !important;
           }
       
           #urlbar-container ~ :is(#back-button, #forward-button) {
            display: none !important;
           }

           #customization-header::after {
            margin-top:       1em;
            border-radius:    4px;
            background-color: blue;
            color:            white;
            display:          block;
            padding:          .4em .7em;
            width:            max-content;
            content:          "To hide the back & forward buttons, drag them to the right of the URL bar";
           }
          }

          
          /* Single Tab, *Properties* Also in --> "Small Window Fixes" */
          @media (not (-moz-bool-pref: "onebar.disable-single-tab")) {
           .tabbrowser-tab:only-of-type .tab-background,
           .tabbrowser-tab:only-of-type .tab-close-button,
           #tabbrowser-tabs:not([closebuttons="activetab"]) ~ #alltabs-button {
            display: none !important;
           }

           .tabbrowser-tab:only-of-type .tab-text {
            font-weight: 600 !important;
           }

           #titlebar #tabbrowser-tabs .tabbrowser-tab:only-of-type {
            margin-inline-end:      auto !important;
            flex:                   unset !important;
            max-width:              unset !important;
            -moz-box-flex:          unset !important;
            width:                  max-content !important;
            --toolbar-bgcolor:      transparent !important;
            --tab-selected-bgimage: transparent !important;
           }
          }
          
          
          /* Match Button Sizes to Toolbar Buttons */
          #alltabs-button {
           order: -1;
          }

          #TabsToolbar toolbarbutton {
           margin: 0 !important;
          }

          .titlebar-buttonbox-container {
           order: -100 !important;
          }

          #TabsToolbar {
           --toolbarbutton-inner-padding: 8px !important;
          }

          
          /* Toolbar */
          #urlbar-input-container > :not(.urlbar-input-box) {
           order: 2;
          }

          #urlbar-background {
           transition: border .2s;
          }

          #urlbar-input-container {
           display: flex !important;
          }

          .urlbar-input-box {
           transition:   width .2s;
           flex-grow:    1 !important;
           min-width:    50px !important;
           padding-left: .5em !important;
           width:        100px !important;
          }

          #urlbar[breakout-extend] {
           inset-inline: 20vw !important;
           width:        unset !important;
           position:     absolute !important;
          }

          #urlbar {
           margin-block: auto !important;
           top:          unset !important;
           position:     relative !important;
           align-self:   flex-start !important;
          }

          @media (-moz-bool-pref: "onebar.disable-centering-of-URLbar") {
           #urlbar[breakout-extend] {
            inset-inline: 0 !important;
           }

           #urlbar[breakout-extend] .urlbar-input-box {
            min-width: 400px !important;
           }

           #urlbar-container {
            position: relative !important;
           }

           #urlbar-container:focus-within, #urlbar-container:hover {
            min-width: var(--urlbar-open-width) !important;
           }
          }

          #urlbar-container {
           z-index:    10;
           width:      unset !important;
           position:   static !important;
           min-width:  var(--urlbar-collapsed-width) !important;
           transition: background-color .2s, width .2s, min-width .2s;
          }

          #urlbar:hover:not([focused="true"]) > #urlbar-background {
           --toolbar-field-border-color: var(--toolbar-field-focus-border-color)
          }
          
          #urlbar-input:not(:focus-within) {
           mask: linear-gradient(to right, black calc(100% - 20px), transparent);
          }

          #nav-bar {
           background: none !important;
           position:   static !important;
           max-width:  calc(100vw - ((2 * var(--toolbarbutton-inner-padding) + 16px) + (var(--toolbarbutton-outer-padding) * 2)) - var(--tab-block-margin)) !important;
          }


          /* Truncate https:// when Collapsed */
          @media (not (-moz-bool-pref: "onebar.disable-https-truncate")) and (not (-moz-bool-pref: "browser.urlbar.trimHttps")) {
           #urlbar-input {
            transition: margin .1s;
           }

           .verifiedDomain ~ .urlbar-input-box:not(:focus-within) #urlbar-input {
            margin-left: -4ch !important;
            mask:        linear-gradient(to right, transparent 4ch, black 5ch calc(100% - 3ch), transparent) !important;
           }
          }
          

          /* Hide Unimportant Buttons Until Hover */
          #urlbar-container:hover #userContext-label, 
          #urlbar-container:hover #page-action-buttons > *,
          #urlbar-container:hover #urlbar-input-container > box:not(#page-action-buttons) {
           max-width:  200px;
           transition: var(--in-transition) !important;
          }

          @media (-moz-bool-pref: "onebar.disable-autohide-of-URLbar-icons") {
           #urlbar-container {
            min-width: var(--urlbar-open-width) !important;
           }
          }

          #urlbar-container #urlbar[focused="true"] #page-action-buttons > *, 
          #urlbar-container #urlbar[focused="true"] #urlbar-input-container > box {
           opacity:        0 !important;
           font-size:      0 !important;
           max-width:      0 !important;
           margin-inline:  0 !important;
           padding-inline: 0 !important;
           transition:     var(--out-transition) !important;
          }
          
          @media (not (-moz-bool-pref: "onebar.disable-autohide-of-URLbar-icons")) {
           #urlbar-container:not(:hover) :where (
              toolbarbutton,
              .verifiedDomain,
              #star-button-box,
              #pageActionButton,
              #userContext-label,
              #tracking-protection-icon-container,
              #pageAction-urlbar-_testpilot-containers,
           ) {
            opacity:        0 !important;
            font-size:      0 !important;
            max-width:      0 !important;
            margin-inline:  0 !important;
            padding-inline: 0 !important;
            transition:     var(--out-transition) !important;
           }

           @media (-moz-bool-pref: "onebar.hide-all-URLbar-icons") {
            #urlbar-container:not(:hover) :where(#page-action-buttons, #identity-box) > * {
             opacity:        0 !important;
             font-size:      0 !important;
             max-width:      0 !important;
             margin-inline:  0 !important;
             padding-inline: 0 !important;
             transition:     var(--out-transition) !important;
            }
           }
          }

          :root {
           --out-transition: font-size .2s, padding .2s, margin .2s, max-width .2s, opacity .07s;
           --in-transition:  font-size .2s, padding .2s, margin .2s, max-width .2s, opacity .2s .15s;
          }


          /* Other Buttons */
          .titlebar-spacer,
          #identity-icon-label {
           display: none;
          }
          
          @media (-moz-bool-pref: "onebar.hide-unified-extensions-button") {
           #unified-extensions-button, #unified-extensions-button > .toolbarbutton-icon{
            width:   0px !important;
            padding: 0px !important;
           }
          }
          
          #nav-bar #search-container {
           transition: min-width .2s;
           min-width:  32px !important;
          }
          
          .toolbarbutton-icon {
           transition: background-color .1s;
          }
          

          /* Wrap Other Toolbars to the Bottom */
          #nav-bar ~ * {
           width: 100vw !important;
          }
          
                                       
          /* Linux Fixes */
          @media (-moz-gtk-csd-available) {
              /* window control padding values (these don't change the size of the actual buttons, only the padding for the navbar) */
              :root[tabsintitlebar] {
                  /* default button/padding size based on adw-gtk3 theme */
                  --uc-win-ctrl-btn-width: 38px;
                  --uc-win-ctrl-padding: 12px;
              }
          
              :root[tabsintitlebar][lwtheme] {
                  /* seperate values for when using a theme, based on the Firefox defaults */
                  --uc-win-ctrl-btn-width: 30px;
                  --uc-win-ctrl-padding: 12px;
              }
              
              /* setting the padding value for all button combinations */
              @media (-moz-gtk-csd-minimize-button),
              (-moz-gtk-csd-maximize-button),
              (-moz-gtk-csd-close-button) {
                  #navigator-toolbox {
                      --uc-navbar-padding: calc(var(--uc-win-ctrl-btn-width) * 1);
                  }
              }
              
              @media (-moz-gtk-csd-minimize-button) and (-moz-gtk-csd-maximize-button),
              (-moz-gtk-csd-minimize-button) and (-moz-gtk-csd-close-button),
              (-moz-gtk-csd-maximize-button) and (-moz-gtk-csd-close-button) {
                  #navigator-toolbox {
                      --uc-navbar-padding: calc(var(--uc-win-ctrl-btn-width) * 2);
                  }
              }
              
              @media (-moz-gtk-csd-minimize-button) and (-moz-gtk-csd-maximize-button) and (-moz-gtk-csd-close-button) {
                  #navigator-toolbox {
                      --uc-navbar-padding: calc(var(--uc-win-ctrl-btn-width) * 3);
                  }
              }
          
              /* only applies padding/positioning if there is 1 or more buttons */
              @media (-moz-gtk-csd-minimize-button),
              (-moz-gtk-csd-maximize-button),
              (-moz-gtk-csd-close-button) {
                  .titlebar-buttonbox-container {
                      left: 0;
                      position: absolute;
                      display: block;
                      z-index: 101;
                  }
                  @media (-moz-gtk-csd-reversed-placement) {
                      #navigator-toolbox {
                          padding-left: calc(var(--uc-navbar-padding, 0) + var(--uc-win-ctrl-padding)) !important;
                      }
                  }
                  /* window controls on the right */
                  @media not (-moz-gtk-csd-reversed-placement) {
                      #nav-bar {
                          padding-right: calc(var(--uc-navbar-padding, 0) + var(--uc-win-ctrl-padding)) !important;
                      }
                      .titlebar-buttonbox-container {
                          right: 0;
                          left: unset;
                      }
                  }
                  .toolbar-items {
                      max-width: calc(100vw - (
                        var(--uc-navbar-padding, 0) + var(--uc-win-ctrl-padding)
                      ));
                  }
              }
          }


          /* Small Window */
          @media (max-width: 700px) {
           #navigator-toolbox:hover #tabbrowser-tabs,
           #navigator-toolbox:focus-within #tabbrowser-tabs {
            opacity: 0;
           }

           #navigator-toolbox:not(:hover):not(:focus-within) #nav-bar {
            opacity: 0;
           }

           #TabsToolbar {
            width: 100vw;
           }

           #navigator-toolbox:hover #nav-bar,
           #navigator-toolbox:focus-within #nav-bar {
            z-index: 2 !important;
           }

           #nav-bar {
            width: 100% !important;
           }
       
           #TabsToolbar-customization-target:first-of-type > :not(#alltabs-button):not(#tabbrowser-tabs),
           #tabbrowser-arrowscrollbox > :not(.tabbrowser-tab) {
            display: none !important;
           }

           #scrollbutton-up,
           #scrollbutton-down {
            display: none !important;
           }
       
           .tabbrowser-tab .tab-background, 
           .tabbrowser-tab .tab-close-button {
            display: none !important;
           }
       
           .tabbrowser-tab:not([visuallyselected]) {
            display: none !important;
           }

           .tabbrowser-tab .tab-text {
            font-weight: 600 !important;
           }

           #navigator-toolbox :is(#urlbar, #urlbar-container) {
            min-width: unset !important;
           }

           #titlebar {
            overflow: visible !important;
           }

           #tabbrowser-tabs {
            padding-inline: 0 !important;
           }

           #navigator-toolbox #tabbrowser-tabs ~ #alltabs-button {
            display: -moz-box !important;
           }

           #urlbar[breakout-extend] {
            z-index:      102 !important;
            inset-inline: 15px !important;
           }
      
           #tabbrowser-tabs, #nav-bar {
            transition: opacity .2s !important;
           }

           #titlebar #tabbrowser-tabs .tabbrowser-tab {
            -moz-box-flex:          100 !important;
            margin-right:           auto !important;
            max-width:              unset !important;
            -moz-box-flex:          unset !important;
            --toolbar-bgcolor:      transparent !important;
            --tab-selected-bgimage: transparent !important;
           }

           @media (-moz-gtk-csd-minimize-button),
           (-moz-gtk-csd-maximize-button),
           (-moz-gtk-csd-close-button) {
            @media (-moz-gtk-csd-reversed-placement) {
             #nav-bar {
              max-width: calc(100vw - ((2 * var(--toolbarbutton-inner-padding) + 16px) + (var(--toolbarbutton-outer-padding) * 2)) - var(--tab-block-margin) - (var(--uc-navbar-padding, 0) + var(--uc-win-ctrl-padding))) !important;
             }
            }
           }
          }
       '';
            
       arkenfox = {
         enable        = true;
         "0000".enable = true;
         "0200".enable = true;
         "0300".enable = true;
         "0400".enable = true;
         "0600".enable = true;
         "0700".enable = true;
         "0800".enable = true;
         "1200".enable = true;
         "1600".enable = true;
         "1700".enable = true;
         "2000".enable = true;
         "2400".enable = true;
         "2600".enable = true;
         "2700".enable = true;
         "6000".enable = true;
         "9000".enable = true;
  
         "5000".enable = false;
         "5500".enable = false;
         "7000".enable = false;
         "8000".enable = false;
  
         "0100" = {
           enable                              = true;
           "0102"."browser.startup.page".value = 3;
         };
  
         "0900" = { 
           enable                                        = true;
           "0904"."signon.formlessCapture.enabled".value = true;
         };
  
         "1000" = {
           enable                                   = true;
           "1001"."browser.cache.disk.enable".value = true;
         };
  
         "2800" = {
           enable = true;
  
           "2811" = {
             "privacy.clearOnShutdown.formdata".value     = true;
             "privacy.clearOnShutdown.downloads".value    = true;
             "privacy.clearOnShutdown.cache".value        = false;
             "privacy.clearOnShutdown.history".value      = false;
             "privacy.clearOnShutdown.sessions".value     = false;
             "privacy.clearOnShutdown.siteSettings".value = false;
           };
  
           "2812"."privacy.clearOnShutdown.openWindows".value = false;

           "2815" = {
             "privacy.clearOnShutdown.cookies".value     = false;
             "privacy.clearOnShutdown.offlineApps".value = false;
           };
         };
  
         "4500" = {
           enable = true;

           "4501" = {
             "privacy.resistFingerprinting".value        = false;
             "privacy.resistFingerprinting.pbmode".value = false;
           };

           "4504"."privacy.resistFingerprinting.letterboxing".value = false;
           "4520"."webgl.disabled".value                            = false;
         };
       };
     };
   };
 };
}
