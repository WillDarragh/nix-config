{ config, pkgs, ... }:
{

  home.packages = with pkgs; [

    # Bitwarden
    bitwarden-desktop

    # Obsdiain
    obsidian

    # Discord client
    legcord

    # Spotify
    spotify

  ];

  # Firesfox
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
          proton-pass
          darkreader
          vimium
          facebook-container
        ];
        bookmarks = [
          {
            name = "toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Nix";
                bookmarks = [
                  {
                    name = "Homepage";
                    url = "https://nixos.org/";
                  }
                  {
                    name = "Package Search";
                    url = "https://search.nixos.org/packages";
                  }
                  {
                    name = "Home Manager Option Search";
                    url = "https://home-manager-options.extranix.com/?query=&release=release-24.11";
                  }
                ];
              }
            ];
          }
        ];
        search.default = "DuckDuckGo";
        search.force = true;
        settings = {
          #"layout.css.devPixelsPerPx" = 1.5;
          "browser.tabs.closeWindowWithLastTab" = false;
          "extensions.pocket.enabled" = false;
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "browser.preferences.moreFromMozilla" = false;
          #"browser.urlbar.suggest.engines" = false;
          "signon.rememberSignons" = false;
          "signon.autfillForms" = false;
          "services.sync.prefs.signon.autoFilForms" = false;
          "services.sync.prefs.signong.rememberSignons" = false;
        };
      };
    };
  };

}
