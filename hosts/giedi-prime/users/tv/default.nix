{ config, pkgs, ... }:
{

  home.username = "tv";
  home.homeDirectory = "/home/tv";

  imports = [


  ];

  /*
    home.packages = with pkgs; [

    ];
  */

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        name = "default";
        id = 0;
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          darkreader
          facebook-container
        ];
        search.default = "DuckDuckGo";
        search.force = true;
        settings = {
          # Large Layout for TV
          "layout.css.devPixelsPerPx" = 4.0;

          # Reasonable Behavior
          "browser.tabs.closeWindowWithLastTab" = false; # Do not close window on last tab
          "browser.preferences.moreFromMozilla" = false; # Do not show firefox suggestions

          "extensions.pocket.enabled" = false; # Disable pocket
          "extensions.getAddons.showPane" = false; # Disable addons suggestions
          "extensions.htmlaboutaddons.recommendations.enabled" = false; # Disable web recommendations
          "extensions.formautofill.addresses.enabled" = false; # Disable address manager
          "extensions.formautofill.creditCards.enabled" = false; # Disable credit card manager

          "signon.rememberSignons" = false; # Do not remember signons
          "signon.autfillForms" = false; # Do not autfill forms

          "services.sync.prefs.signon.autoFilForms" = false; # Do not sync forms
          "services.sync.prefs.signong.rememberSignons" = false; # Do not sync signons
        };
      };
    };
  };

}