###########
# VonixOS #
#########################
# FireFox Configuration #
#########################
{ pkgs, vars, ... }:

{
 home-manager.users.${vars.user} = {
   programs.firefox = {
     enable = true;
     profiles.default = {
       id             = 0;
       isDefault      = true;
       search = { 
	 force   = true;
	 default = "DuckDuckGo";
       };
       name           = "default";
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
	  url  = "https://mail.tutanota.com";
	 }
     	 {
	  name = "Nix User Repository";
	  url  = "https://nur.nix-community.org";
	 }
     	 {
	  name = "NixOS";
	  url  = "https://search.nixos.org/packages";
	 }
     	 {
	  name = "Certificates";
	  url  = "https://devopscube.com/best-devops-certifications";
	 }
     	 {
	  name = "NixNeovim";
	  url  = "https://nixneovim.github.io/nixneovim-option-search";
	 }
     	 {
	  name = "Home-Manager";
	  url  = "https://mipmip.github.io/home-manager-option-search";
	 }
       ];
       settings = {
         #########################
	 # Document Object Model #
         #########################
         "dom.disable_window_move_resize" = true;
         ##############
	 # Containers #
         ##############
         "privacy.userContext.enabled"    = true;
         "privacy.userContext.ui.enabled" = true;
         ###########
	 # Studies #
         ###########
         "app.normandy.api_url"             = "";
         "app.shield.optoutstudies.enabled" = false;
         "app.normandy.enabled"             = false;
         ################################
	 # Enhanced Tracking Protection #
         ################################
         "browser.contentblocking.category" = "strict";
         ###########################
	 # Shutdown and Sanitizing #
         ###########################
         "privacy.clearOnShutdown.cookies"      = true;
         "privacy.clearOnShutdown.formdata"     = true;
         "privacy.clearOnShutdown.sessions"     = true;
         "privacy.clearOnShutdown.downloads"    = true;
         "privacy.clearOnShutdown.offlineApps"  = true;
         "privacy.clearOnShutdown.cache"        = false;
         "privacy.clearOnShutdown.history"      = false;
         "privacy.sanitize.sanitizeOnShutdown"  = false;
         "privacy.clearOnShutdown.siteSettings" = false;
         #########
	 # Other #
         #########
         "captivedetect.canonicalURL"             = "";
         "network.captive-portal-service.enabled" = false;
         "network.connectivity-service.enabled"   = false;
         ###########################
	 # Essential: Leave As Is! #
         ###########################
         "security.dialog_enable_delay"           = 1000;
         "extensions.blocklist.enabled"           = true;
         "extensions.webcompat.enable_shims"      = true;
         "extensions.quarantinedDomains.enabled"  = true;
         "privacy.firstparty.isolate"             = false;
         "network.http.referer.spoofSource"       = false;
         "extensions.webcompat-reporter.enabled"  = false;
         "security.tls.version.enable-deprecated" = false;
         #################
	 # Safe Browsing #
         #################
         "browser.safebrowsing.malware.enabled"   = false;
         "browser.safebrowsing.phishing.enabled"  = false;
         "browser.safebrowsing.downloads.enabled" = false;
         ############
	 # Referers #
         ############
         "network.http.referer.XOriginTrimmingPolicy" = 2;
         #############
	 # Passwords #
         #############
         "network.auth.subresource-http-auth-allow" = 1;
         "signon.autofillForms"                     = false;
         ##################
	 # Disk Avoidance #
         ##################
         "browser.sessionstore.privacy_level"            = 2;
         "browser.cache.disk.enable"                     = true;
         "browser.privatebrowsing.forceMediaMemoryCache" = false;
         "browser.shell.shortcutFavicons"                = false;
         "media.memory_cache_max_size"                   = 65536;
         ##########################################################
	 # Location & Search Bars, Suggestions, History and Forms #
         ##########################################################
         "browser.formfill.enable"                          = false;
         "browser.search.suggest.enabled"                   = false;
         "browser.urlbar.mdn.featureGate"                   = false;
         "browser.urlbar.suggest.searches"                  = false;
         "browser.urlbar.pocket.featureGate"                = false;
         "browser.urlbar.addons.featureGate"                = false;
         "browser.urlbar.weather.featureGate"               = false;
         "browser.urlbar.trending.featureGate"              = false;
         "browser.urlbar.clipboard.featureGate"             = false;
         "browser.urlbar.speculativeConnect.enabled"        = false;
         "browser.urlbar.suggest.quicksuggest.sponsored"    = false;
         "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
         #################
	 # Crash Reports #
         #################
         "breakpad.reportURL"                                 = "";
         "browser.tabs.crashReporting.sendReport"             = false;
         "browser.crashReports.unsubmittedCheck.autoSubmit2"  = false;
         #########################
	 # Resist Fingerprinting #
         #########################
         "browser.link.open_newwindow"                        = 3;
         "browser.link.open_newwindow.restriction"            = 0;
         "privacy.window.maxInnerWidth"                       = 1900;
         "privacy.window.maxInnerHeight"                      = 1000;
         "privacy.resistFingerprinting"                       = true;
         "widget.non-native-theme.enabled"                    = true;
         "privacy.resistFingerprinting.block_mozAddonManager" = true;
         "webgl.disabled"                                     = false;
         "browser.display.use_system_colors"                  = false;
         "privacy.resistFingerprinting.letterboxing"          = false;
         #############
	 # Quiet Fox #
         #############
         "browser.discovery.enabled"                          = false;
         "extensions.getAddons.showPane"                      = false;
         "browser.shopping.experience2023.enabled"            = false;
         "extensions.htmlaboutaddons.recommendations.enabled" = false;
         #############################
	 # Plugins, Media and WebRTC #
         #############################
         "media.peerconnection.ice.default_address_only"       = true;
         "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
         #################
	 # Miscellaneous #
         #################
         "extensions.enabledScopes"                              = 5;
         "extensions.autoDisableScopes"                          = 15;
         "permissions.manager.defaultsUrl"                       = "";
         "webchannel.allowObject.urlWhitelist"                   = "";
         "network.IDN_show_punycode"                             = true;
         "browser.download.useDownloadDir"                       = true;
         "browser.helperApps.deleteTempFileOnExit"               = true;
         "browser.download.start_downloads_in_tmp_dir"           = true;
         "pdfjs.disabled"                                        = false;
         "pdfjs.enableScripting"                                 = false;
         "browser.uitour.enabled"                                = false;
         "devtools.debugger.remote-enabled"                      = false;
         "browser.download.alwaysOpenPanel"                      = false;
         "extensions.postDownloadThirdPartyPrompt"               = false;
         "browser.download.manager.addToRecentDocs"              = false;
         "browser.download.always_ask_before_handling_new_types" = false;
         #############
	 # Telemetry #
         #############
         "toolkit.coverage.endpoint.base"                     = "";
         "toolkit.telemetry.coverage.opt-out"                 = true;
         "toolkit.coverage.opt-out"                           = true;
         "datareporting.policy.dataSubmissionEnabled"         = false;
         "datareporting.healthreport.uploadEnabled"           = false;
         "toolkit.telemetry.unified"                          = false;
         "toolkit.telemetry.enabled"                          = false;
         "toolkit.telemetry.archive.enabled"                  = false;
         "toolkit.telemetry.newProfilePing.enabled"           = false;
         "toolkit.telemetry.shutdownPingSender.enabled"       = false;
         "toolkit.telemetry.bhrPing.enabled"                  = false;
         "toolkit.telemetry.firstShutdownPing.enabled"        = false;
         "browser.ping-centre.telemetry"                      = false;
         "browser.newtabpage.activity-stream.feeds.telemetry" = false;
         "browser.newtabpage.activity-stream.telemetry"       = false;
         "toolkit.telemetry.server"                           = "data:,";
         #########
	 # HTTPS #
         #########
         "security.OCSP.enabled"                                     = 1;
         "security.cert_pinning.enforcement_level"                   = 2;
         "security.pki.crlite_mode"                                  = 2;
         "security.OCSP.require"                                     = true;
         "dom.security.https_only_mode"                              = true;
         "security.ssl.require_safe_negotiation"                     = true;
         "browser.xul.error_pages.expert_bad_cert"                   = true;
         "security.remote_settings.crlite_filters.enabled"           = true;
         "security.ssl.treat_unsafe_negotiation_as_broken"           = true;
         "security.tls.enable_0rtt_data"                             = false;
         "dom.security.https_only_mode_send_http_background_request" = false;
         #######################################
	 # Personal Preferences (Non-ArkenFox) #
         #######################################
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
         ###########
	 # Startup #
         ###########
         "browser.startup.page"                                     = 3;
         "browser.newtabpage.activity-stream.default.sites"         = "";
         "browser.newpage.enabled"                                  = false;
         "browser.newtabpage.activity-stream.showSponsored"         = false;
         "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
         "browser.startup.homepage"                                 = "about:blank";
         ############
	 # Optional #
         ############
         "browser.urlbar.showSearchTerms.enabled"                             = false;
         "browser.messaging-system.whatsNewPanel.enabled"                     = false;
         "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons"   = false;
         "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
         "browser.startup.homepage_override.mstone"                           = "ignore";
         #################################
	 # Geolocation, Language, Locale #
         #################################
         "geo.provider.use_geoclue" = false;
         "intl.accept_languages"    = "en_GB, en";
         "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
       };
     };
   };
 };
}
