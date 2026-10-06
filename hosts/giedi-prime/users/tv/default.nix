{ config, pkgs, lib, ... }:
{

  home.username = "tv";
  home.homeDirectory = "/home/tv";

  imports = [


  ];

  /*
    home.packages = with pkgs; [

    ];
  */

  home.stateVersion = "26.11";

  programs.home-manager.enable = true;

  # Firefox 
  programs.firefox = {
    enable = true;

    policies = {
      NoDefaultBookmarks = true;
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
        };
        "@contain-facebook" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/facebook-container/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles = {
      default = {
        name = "default";
        id = 0;
        isDefault = true;
        search.default = "ddg";
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