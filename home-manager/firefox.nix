#* Firefox
{ inputs, pkgs, ... }:
{
  programs.firefox = let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in {
    # TODO: Replace policies and preferences with those seen in BetterFox.
    enable = true;
    nativeMessagingHosts = with pkgs; [ uget-integrator ff2mpv ];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;

      Preferences = {
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        "browser.newtabpage.activity-stream.feeds.system.topstories" = lock-false;
        "browser.newtabpage.activity-stream.section.topstories.rows" = "0";
        "services.sync.prefs.sync.browser.newtabpage.activity-stream.section.topstories.rows" = "0";
        "services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
      };
    };

    profiles.orsell = {
      search = {
        force = true;
        default = "Brave";
        engines = {
          "Brave" = {
            urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
            definedAliases = ["@b"];
          };
        };
      };

      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        link-cleaner
        privacy-badger
        ff2mpv
      ];
    };
  };
}
