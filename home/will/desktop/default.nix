{ config, pkgs, ... }:
{

  home.packages = with pkgs; [

    # Bitwarden
    #bitwarden-desktop

    # Obsdiain
    obsidian

    # Discord client
    vesktop

    # Spotify
    spotify

  ];

  # Firefox
  programs.librewolf = {
    enable = true;

    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          default_area = "navbar";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          default_area = "navbar";
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4875950/bitwarden_password_manager-2026.6.1.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
          "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
          default_area = "navbar";
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4824869/proton_pass-1.37.2.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
          "addon@darkreader.org" = {
          default_area = "navbar";
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4859299/darkreader-4.9.128.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          default_area = "navbar";
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4717567/vimium_ff-2.4.2.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
          "@contain-facebook" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4451874/facebook_container-2.3.12.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };

    profiles = {
      default = {
        name = "default";
        id = 0;
        isDefault = true;
        bookmarks = {
          force = true;
          settings = [
          {
            name = "Nix";
            toolbar = true;
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
        };
        };
        #search.force = true;
        #search.default = "DuckDuckGo";
        #search.privateDefault = "DuckDuckGo";
        /*settings = {
          #"browser.tabs.closeWindowWithLastTab" = false; # Do not close window on last tab
          #"browser.preferences.moreFromMozilla" = false; # Do not show firefox suggestions

          "extensions.pocket.enabled" = false; # Disable pocket
          "extensions.getAddons.showPane" = false; # Disable addons suggestions
          "extensions.htmlaboutaddons.recommendations.enabled" = false; # Disable web recommendations
          "extensions.formautofill.addresses.enabled" = false; # Disable address manager
          "extensions.formautofill.creditCards.enabled" = false; # Disable credit card manager

          "signon.rememberSignons" = false; # Do not remember signons
          "signon.autfillForms" = false; # Do not autfill forms

          "services.sync.prefs.signon.autoFilForms" = false; # Do not sync forms
          "services.sync.prefs.signong.rememberSignons" = false; # Do not sync signons
        };*/
      };
    };

}
