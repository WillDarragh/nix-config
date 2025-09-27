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
                    name = "Wiki";
                    url = "https://wiki.nixos.org/wiki/NixOS_Wiki";
                  }
                  {
                    name = "Package Search";
                    url = "https://search.nixos.org/packages";
                  }
                  {
                    name = "Home Manager Option Search";
                    url = "https://home-manager-options.extranix.com/?query=&release=release-24.11";
                  }
                  { name = "NixOS & Flakes Book";
                    url = "https://nixos-and-flakes.thiscute.world";
                  }
                ];
              }
            ];
          }
        ];
        search.default = "DuckDuckGo";
        search.force = true;
        settings = {
          "browser.tabs.closeWindowWithLastTab" = false; # Do not close window on last tabe
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
