###########
# VonixOS #
#########################
# FireFox Configuration #
#########################
{ pkgs, vars, ... }:

{
 imports = [ ./arkenfox.nix ];

 home-manager.users.${vars.user}.programs = {
     firefox = {
       enable = true;
  
       profiles.default = {
         id = 0;
  
         search = { 
    	     force   = true;
    	     default = "DuckDuckGo";
         };
  
         extensions = with pkgs.nur.repos.rycee.firefox-addons; [
           bitwarden
    	     darkreader
    	     ublock-origin
         ];
  
         bookmarks = [
         {
     	    name = "GitHub";
     	    url  = "https://github.com";
     	   }
         {
     	    name = "ChatGPT";
     	    url  = "https://chat.openai.com";
     	   }
         {
     	    name = "Roadmap";
     	    url  = "https://roadmap.sh/devops";
     	   }
         {
     	    name = "Tutanota";
     	    url  = "https://app.tuta.com/login";
     	   }
         {
     	    name = "Coinbase";
     	    url  = "https://www.coinbase.com/home";
     	   }
         {
     	    name = "Nix User Repository";
     	    url  = "https://nur.nix-community.org";
     	   }
         {
     	    name = "NixOS Packages";
     	    url  = "https://search.nixos.org/packages";
     	   }
         {
     	    name = "NixOS Options";
     	    url  = "https://search.nixos.org/options?";
     	   }
         {
     	    name = "Certificates";
     	    url  = "https://devopscube.com/best-devops-certifications";
     	   }
         {
     	    name = "Home-Manager";
     	    url  = "https://mipmip.github.io/home-manager-option-search";
     	   }
       ];
  
       settings = {
         #######################################
      	 # Personal Preferences (Non-ArkenFox) #
         #######################################
      	 "ui.systemUsesDarkTheme"                                      = 1;
      	 "extensions.webextensions.restrictedDomains"                  = "";
         "general.autoScroll"                                          = true;
         "accessibility.typeaheadfind"                                 = true;
         "browser.urlbar.suggest.bookmark"                             = true;
         "media.hardwaremediakeys.enabled"                             = true;
         "browser.ctrlTab.recentlyUsedOrder"                           = true;
         "signon.management.page.breach-alerts.enabled"                = true;
         "media.videocontrols.picture-in-picture.enabled"              = true;
         "general.smoothScroll"                                        = false;
         "signon.rememberSignons"                                      = false;
         "browser.tabs.warnOnClose"                                    = false;
         "browser.newtabpage.enabled"                                  = false;
         "signon.generation.available"                                 = false;
         "accessibility.browsewithcaret"                               = false;
         "browser.tabs.loadInBackground"                               = false;
         "browser.urlbar.suggest.history"                              = false;
         "browser.urlbar.suggest.openpage"                             = false;
         "widget.wayland.overlay-scrollbars"                           = false;
         "browser.newtabpage.activity-stream.showSearch"               = false;
         "browser.newtabpage.activity-stream.feeds.snippets"           = false;
         "browser.newtabpage.activity-stream.feeds.topsites"           = false;
         "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
         "intl.locale.requested"                                       = "en-GB";
         #########
      	 # Theme #
         #########
      	 "font.name.monospace.x-western"     = "Liberation Mono";
      	 "font.name.sans-serif.x-western"    = "Liberation Sans";
      	 "font.default.x-western"            = "Liberation Serif";
      	 "font.name.serif.x-western"         = "Liberation Serif";
         "lightweightThemes.selectedThemeID" = "firefox-compact-dark@mozilla.org";
       };
     };
   };
 };
}
