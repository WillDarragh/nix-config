
{ config, pkgs, ... }: {

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
            name = "Test";
            #tags = [""];
            #keyword = "";
            url = "www.google.com";
            #toolbar = true;
            #bookmarks = [];
          }
        ];
        search.default = "DuckDuckGo";
        search.force = true;
        settings = {
          "layout.css.devPixelsPerPx" = 1.5;
        };
      };
    };
  };

} 
